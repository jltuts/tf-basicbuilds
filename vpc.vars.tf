variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = "string"
}

variable "az1" {
  description = "The availability zone 1"
  default     = ""
}

variable "az2" {
  description = "The availability zone 2"
  default     = ""
}