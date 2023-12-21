terraform {
  backend "s3" {
    bucket = "ncukpreprod-eks"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}

