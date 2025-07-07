import boto3
from config import PROFILE, REGION
from vpc import create_vpc
from security_groups import create_security_groups
from alb_autoscaling import create_alb_asg

# Create session with profile and region
session = boto3.Session(profile_name=PROFILE, region_name=REGION)

# Inject session into service modules if needed
print("🔧 Creating VPC...")
vpc_id, subnet_ids = create_vpc(session)
print(f"✅ VPC created: {vpc_id}")

print("🔧 Creating Security Groups...")
alb_sg_id, ec2_sg_id = create_security_groups(session, vpc_id)
print("✅ Security Groups created")

print("🔧 Creating ALB and Auto Scaling Group...")
create_alb_asg(session, vpc_id, subnet_ids, alb_sg_id, ec2_sg_id)
print("✅ ALB + ASG created")
