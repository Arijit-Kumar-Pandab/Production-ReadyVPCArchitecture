variable "region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "aws_version" {
  description = "AWS Provider Version"
  type = string
}

variable "vpc_cidr_blocl" {
  description = "VPC CIDR Block"
}

variable "vpc_name" {
  description = "VPC Name"
}