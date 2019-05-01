# tf-basicbuilds
This repo is used to build basic aws services such as vpc, ec2 and s3 via terraform.

# prerequisite
1. Configure the s3_backend.tf to your s3 bucket.
2. Create a file named "terraform.tfvars" with your own values.

aws_region                                              = "us-east-1"
credentials_file_path                                   = "/Users/yourname/.aws/credentials"
profile                                                 = "jltuts"
client_name                                             = "jltuts"
environment_name                                        = "dev"
cidr_block                                              = "10.0.0.0/22"
az1                                                     = "us-east-1a" 
az1                                                     = "us-east-1b" 


# AWS Resources

VPC
* subnets
* route table
* route table association
* internet gateway
* nat gateways