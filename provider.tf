# Configure provider
  provider "aws" { 
    region = "us-east-2" 
    access_key=var.AWS_ACCESS_KEY 
    secret_key=var.AWS_SECRET_KEY 
  } 
