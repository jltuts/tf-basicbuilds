# tf-basicbuilds
This repo is used to build basic aws services such as vpc, ec2 and s3 via terraform.

# prerequisite
1. Install and configure awscli with a profile. Use this profile in your terraform.vars.
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
cidr_block_public_1                                     = "10.0.0.0/24"
cidr_block_public_2                                     = "10.0.1.0/24"
cidr_block_private_1                                    = "10.0.2.0/24"
cidr_block_private_2                                    = "10.0.3.0/24"


# AWS Resources
VPC
* Subnets
  * public 1
  * public 2
  * private 1
  * private 2
* Route Table
* Route Table Association
* Internet Gateway
* Elastic IPs
* Nat Gateways
  * NAT 1
  * NAT 2