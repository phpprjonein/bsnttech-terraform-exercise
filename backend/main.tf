terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }

  backend "s3" {
    bucket = "thisisterraformclass"      
    key    = "testtestdemo.tfstate" 
    region = "ap-south-1"            
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test123" {
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t3.micro"

  tags = {
    Name = "test123"
  }
}

output "aws_instance_public_ip" {
  value = aws_instance.test123.public_ip
}