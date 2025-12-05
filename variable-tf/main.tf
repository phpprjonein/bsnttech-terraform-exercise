terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.15.0"
    }
  }
}

resource "aws_instance" "web" {
  ami           = var.os
  instance_type = var.Size

  tags = {
    Name = var.name
  }
}



resource "aws_s3_bucket" "bucket" {
    bucket = var.bucketname
  
}