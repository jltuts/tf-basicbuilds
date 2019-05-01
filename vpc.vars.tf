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

variable "cidr_block_public_1" {
  description = "The cidr block of public subnet 1"
  default     = ""
}

variable "cidr_block_public_2" {
  description = "The cidr block of public subnet 2"
  default     = ""
}

variable "cidr_block_private_1" {
  description = "The cidr block of private subnet 1"
  default     = ""
}

variable "cidr_block_private_2" {
  description = "The cidr block of private subnet 2"
  default     = ""
}