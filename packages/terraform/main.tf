terraform {
  required_version = ">=0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42"
    }
  }
}

provider "aws" {
  profile = "kanap"
  region  = "us-west-2"
}

variable "project-name" {
  type    = string
  default = "project"
}

variable "environment-name" {
  type    = string
  default = "test"
}
