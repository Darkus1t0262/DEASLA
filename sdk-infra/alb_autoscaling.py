import boto3
from config import AMI_ID, INSTANCE_TYPE, KEY_NAME

def create_alb_asg(session, vpc_id, subnets, alb_sg_id, ec2_sg_id):
    ec2 = session.client('ec2')
    elb = session.client('elbv2')
    asg = session.client('autoscaling')

    lb = elb.create_load_balancer(
        Name='deasla-lb',
        Subnets=subnets,
        SecurityGroups=[alb_sg_id],
        Scheme='internet-facing',
        Type='application',
        IpAddressType='ipv4'
    )
    lb_arn = lb['LoadBalancers'][0]['LoadBalancerArn']

    tg = elb.create_target_group(
        Name='deasla-tg',
        Protocol='HTTP',
        Port=80,
        VpcId=vpc_id,
        TargetType='instance'
    )
    tg_arn = tg['TargetGroups'][0]['TargetGroupArn']

    elb.create_listener(
        LoadBalancerArn=lb_arn,
        Protocol='HTTP',
        Port=80,
        DefaultActions=[{'Type': 'forward', 'TargetGroupArn': tg_arn}]
    )

    lt = ec2.create_launch_template(
        LaunchTemplateName='deasla-lt',
        LaunchTemplateData={
            'ImageId': AMI_ID,
            'InstanceType': INSTANCE_TYPE,
            'KeyName': KEY_NAME,
            'SecurityGroupIds': [ec2_sg_id],
            'UserData': '',
        }
    )
    lt_id = lt['LaunchTemplate']['LaunchTemplateId']

    asg.create_auto_scaling_group(
        AutoScalingGroupName='deasla-asg',
        LaunchTemplate={
            'LaunchTemplateId': lt_id,
            'Version': '$Latest'
        },
        MinSize=1,
        MaxSize=3,
        DesiredCapacity=2,
        VPCZoneIdentifier=','.join(subnets),
        TargetGroupARNs=[tg_arn],
        HealthCheckType='EC2'
    )