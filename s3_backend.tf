terraform {
  backend "s3" {
    bucket  = "jltuts"
    key     = "tfstate/terraform.tfstate"
    region  = "us-east-1"
    profile = "jltuts"
  }
}