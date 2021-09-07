terraform {
  required_version = ">=0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42"
    }
  }
  backend "local" {}
}

provider "aws" {
  profile = "terraform"
  region  = "us-east-1"

  access_key = "mock_access_key"
  secret_key = "mock_secret_key"

  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam     = "http://localhost:4566"
    kinesis = "http://localhost:4566"
    lambda  = "http://localhost:4566"
    s3      = "http://localhost:4566"
  }
}

variable "project-name" {
  type    = string
  default = "project-name-sample"
}

variable "environment" {
  type    = string
  default = "sample-environment"
}
