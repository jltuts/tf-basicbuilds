variable "client_name" {
  description = "The name of the client / customer."
  type     = "string"
}

variable "environment_name" {
  description = "The name of the environment (sandbox, dev, uat, prd)."
  type     = "string"
}

variable "purpose" {
  description = "The purpose of the aws resource"
  default     = ""
}

variable "creator" {
  description = "The one who deploys this terraform scripts"
  default     = ""
}

locals {
  resource_tags = {
    Client      = "${var.client_name}"
    Environment = "${var.environment_name}"
    Purpose     = "${var.purpose}"
    Creator     = "${var.creator}"
  }
}