module "custom_vpc" {
  source          = "github.com/<your-username>/terraform-aws-vpc-custom"
  vpc_name        = "my-vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.0.0/24"]
  private_subnets = ["10.0.1.0/24"]
} 
