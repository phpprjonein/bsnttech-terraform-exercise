
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "myserver" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t3.micro"

  tags = {
    Name = "SampleServer" }
}
