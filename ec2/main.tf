terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "besantec2" {
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t2.micro"

  tags = {
    Name = "besantec2" }
}
