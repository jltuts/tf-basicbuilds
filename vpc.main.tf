module "vpc" {
  source = "./modules/vpc"
  
  client_name           = "${var.client_name}"
  environment_name      = "${var.environment_name}"
  cidr_block            = "${var.cidr_block}"
  purpose               = "${var.purpose}"
  az1                   = "${var.az1}"
  az2                   = "${var.az2}"
  cidr_block_public_1   = "${var.cidr_block_public_1}"
  cidr_block_public_2   = "${var.cidr_block_public_2}"
  cidr_block_private_1  = "${var.cidr_block_private_1}"
  cidr_block_private_2  = "${var.cidr_block_private_2}"

}