terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "testscolar" {
    ami = "ami-03aa99ddf5498ceb9"
    instance_type = "t3.micro"

    tags = {
        Name = "sample"
    }
  
}


resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "terraweektestdemo-demo-state-bucket"
}

resource "aws_dynamodb_table" "my_dynamo_table" {
  name         = "terraweektestdemo-demo-state-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name  = "LockID"
    type = "S"
  }
}
