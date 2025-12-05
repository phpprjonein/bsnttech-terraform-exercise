terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.15.0"
    }
  }
}

resource "aws_instance" "web" {
  ami           = var.os #ubuntu
 # instance_type = "t3.micro"
  instance_type = var.Size
  tags = {
  #  Name = "HelloWorld"
    Name = var.name  
  }
}

variable "os" {
  type        = string
  default     = "ami-03aa99ddf5498ceb9"
  description = "This is my ami ID"
}

variable "Size" {
  default = "t3.micro"     
}

variable "name" {
  default = "testdemo"
}