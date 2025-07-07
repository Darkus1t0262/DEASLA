import os

# Deployment region
REGION = "us-east-1"

# Instance configuration
AMI_ID = "ami-0c02fb55956c7d316"  # Amazon Linux 2
INSTANCE_TYPE = "t3.large"
KEY_NAME = "DEAS-LA.pem"  # Ensure this keypair exists in the selected AWS account

# AWS credentials profile
# Set with: AWS_PROFILE=core-prod python main.py
PROFILE = os.getenv("AWS_PROFILE", "core-prod")
