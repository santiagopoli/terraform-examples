variable "infrastructure_version" {
  default = "1"
}

provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-bluegreen"
    region  = "us-east-1"
    key     = "v1"
  }
}
