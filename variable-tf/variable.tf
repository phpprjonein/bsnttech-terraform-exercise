variable "os" {
  type        = string
  default     = "ami-03aa99ddf5498ceb9"   
  description = "AMI ID for the EC2 instance"
}

variable "Size" {
  type        = string
  default     = "t3.micro"                
  description = "Instance type for the EC2 instance"
}

variable "name" {
  type        = string
  default     = "testdemo"               
  description = "Name tag for the EC2 instance"
}

variable "bucketname" {
default = "bsnttech-terraform-bucket-12345"
}