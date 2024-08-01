terraform {
  backend "s3" {
    bucket = "mehar-buket"
    key = "Two-Tier-Architecture-with-Terraform/StateFile"
    region = "us-west-2"
    dynamodb_table = "mehar-state-lock"
  }
}