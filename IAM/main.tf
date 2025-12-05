provider "aws" {
  region = "ap-south-1"
}

# Create IAM user
resource "aws_iam_user" "besant_class" {
  name = "iam_besant"
}

# Attach EC2 Full Access Policy to IAM user
resource "aws_iam_user_policy_attachment" "pooja_test_ec2_access" {
  user       = aws_iam_user.besant_class.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
