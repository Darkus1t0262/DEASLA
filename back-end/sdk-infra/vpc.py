import boto3
from config import REGION

ec2 = boto3.client('ec2', region_name=REGION)

def create_vpc(session):
    ec2 = session.client('ec2')

    # 1. Create VPC
    vpc = ec2.create_vpc(CidrBlock='10.0.0.0/16')
    vpc_id = vpc['Vpc']['VpcId']
    ec2.modify_vpc_attribute(VpcId=vpc_id, EnableDnsSupport={'Value': True})
    ec2.modify_vpc_attribute(VpcId=vpc_id, EnableDnsHostnames={'Value': True})

    # 2. Create Internet Gateway
    igw = ec2.create_internet_gateway()
    igw_id = igw['InternetGateway']['InternetGatewayId']
    ec2.attach_internet_gateway(InternetGatewayId=igw_id, VpcId=vpc_id)

    # 3. Create Subnets in two AZs
    azs = ec2.describe_availability_zones()['AvailabilityZones']
    subnet_ids = []
    for i in range(2):
        subnet = ec2.create_subnet(
            VpcId=vpc_id,
            CidrBlock=f'10.0.{i}.0/24',
            AvailabilityZone=azs[i]['ZoneName']
        )
        subnet_ids.append(subnet['Subnet']['SubnetId'])

    # 4. Routing
    rt = ec2.create_route_table(VpcId=vpc_id)
    rt_id = rt['RouteTable']['RouteTableId']
    ec2.create_route(RouteTableId=rt_id, DestinationCidrBlock='0.0.0.0/0', GatewayId=igw_id)

    for subnet_id in subnet_ids:
        ec2.associate_route_table(RouteTableId=rt_id, SubnetId=subnet_id)

    return vpc_id, subnet_ids
