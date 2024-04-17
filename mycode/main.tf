
# define terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "pro_adtsllc" {
  cidr_block = "10.0.0.0/16"
}


# create my public subnet
resource "aws_subnet" "pubsbnt_adtsllc" {
  vpc_id     = aws_vpc.pro_adtsllc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "pubsbnt_adtsllc"
  }
}

resource "aws_subnet" "pubsbt3_adtsllc" {
  vpc_id     = aws_vpc.pro_adtsllc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Pubsbt3_adtsllc"
  }
}

#creating my private subnet
resource "aws_subnet" "pt_adtsllc" {
  vpc_id     = aws_vpc.pro_adtsllc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Pt_adtsllc"
  }
}


resource "aws_subnet" "pt2_adtsllc" {
  vpc_id     = aws_vpc.pro_adtsllc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Pt2_adtsllc"
  }
}