variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_version" {
  description = "AWS Provider Version"
  type        = string
  default = "6.32.1"
}

variable "vpc_cidr_blocl" {
  description = "VPC CIDR Block"
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "VPC Name"
  default = "production-ready-vpc"
}

variable "subnets" {
  description = "Subnet config"
  type = map(object({
    cidr = string
    az   = string
    type = string
  }))

  default = {
    publicSubnet1 = {
      cidr = "10.0.1.0/24"
      az   = "us-east-2a"
      type = "public"
    }

    publicSubnet2 = {
      cidr = "10.0.2.0/24"
      az   = "us-east-2b"
      type = "public"
    }

    privateSubnet1 = {
      cidr = "10.0.4.0/24"
      az   = "us-east-2c"
      type = "private"
    }

    privateSubnet2 = {
      cidr = "10.0.5.0/24"
      az   = "us-east-2a"
      type = "private"
    }
  }
}