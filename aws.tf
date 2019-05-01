variable "aws_region" {
  description = "The AWS region."
  default     = "us-east-1"
}

variable "credentials_file_path" {
  description = "credentials for terraform."
  default     = ""
}

variable "profile" {
  description = "profile for terraform."
  default     = ""
}

provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "${pathexpand(var.credentials_file_path)}"
  profile                 = "${var.profile}"
}



