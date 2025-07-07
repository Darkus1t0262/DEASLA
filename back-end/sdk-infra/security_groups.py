import boto3
from config import REGION

ec2 = boto3.client('ec2', region_name=REGION)

def create_security_groups(session, vpc_id):
    ec2 = session.client('ec2')

    alb_sg = ec2.create_security_group(
        GroupName='alb-sg',
        Description='ALB SG',
        VpcId=vpc_id
    )
    ec2.authorize_security_group_ingress(
        GroupId=alb_sg['GroupId'],
        IpPermissions=[
            {'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80, 'IpRanges': [{'CidrIp': '0.0.0.0/0'}]},
            {'IpProtocol': 'tcp', 'FromPort': 443, 'ToPort': 443, 'IpRanges': [{'CidrIp': '0.0.0.0/0'}]}
        ]
    )

    ec2_sg = ec2.create_security_group(
        GroupName='ec2-sg',
        Description='EC2 SG',
        VpcId=vpc_id
    )
    ec2.authorize_security_group_ingress(
        GroupId=ec2_sg['GroupId'],
        IpPermissions=[
            {'IpProtocol': 'tcp', 'FromPort': 80, 'ToPort': 80, 'UserIdGroupPairs': [{'GroupId': alb_sg['GroupId']}]}
        ]
    )

    return alb_sg['GroupId'], ec2_sg['GroupId']