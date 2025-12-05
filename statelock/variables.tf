variable "region" {
    default = "ap-south-1"
}
variable "bucket_name" {
    default = "its-terraform-remote-state-lockexaample"
}
variable "lock_table" {
    default = "terraform-locks"
}
variable "environment" {
    default = "dev"
}