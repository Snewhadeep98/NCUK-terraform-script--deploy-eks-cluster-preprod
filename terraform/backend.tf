terraform {
  backend "s3" {
    bucket = "ekspreprod"
    region = "us-east-2"
    key = "eks/terraform.tfstate"
  }
}

