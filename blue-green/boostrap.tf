variable "infrastructure_version" {
  default = "2"
}

provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-bluegreen"
    region  = "us-east-1"
    key     = "v2"
  }
}
