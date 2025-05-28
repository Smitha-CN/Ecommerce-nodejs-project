terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  alias  = "us_east_1"
  region = "ca-central-1"
}


 # VPCs
# data "aws_caller_identity" "current" {}

 resource "aws_vpc" "vpc_us_east_1" {
  provider             = aws.us_east_1
  cidr_block           = var.vpc_cidr_us_east_1
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-us-east-1"
  }
}

