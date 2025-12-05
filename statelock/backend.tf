terraform {
    backend "s3" {
        bucket ="its-terraform-remote-state-lockexaample"
        key = "dev/project/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terraform-locks"
        encrypt = true
    }
}