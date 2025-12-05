terraform {
  required_providers {
    aws = {
     source = "hashicorp/aws"
     version = "6.11.0"
    }
  }
}

  provider "aws"{
      region = "ap-south-1"
  }

resource "aws_s3_bucket" "terraformbesant" {
bucket = "terraformbesant"
}