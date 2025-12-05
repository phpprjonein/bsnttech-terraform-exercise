terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

# Create S3 bucket
resource "aws_s3_bucket" "webappclasstestdemo" {
  bucket = "webtesttestdemo98765"
}

# Allow public access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.webappclasstestdemo.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload index.html
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.webappclasstestdemo.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
}

# Public bucket policy
resource "aws_s3_bucket_policy" "webappclasstestdemo" {
  bucket = aws_s3_bucket.webappclasstestdemo.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.webappclasstestdemo.id}/*"
      }
    ]
  })
}


resource "aws_s3_bucket_website_configuration" "webappclasstestdemo" {
  bucket = aws_s3_bucket.webappclasstestdemo.id

  index_document {
    suffix = "index.html"
  }
}
