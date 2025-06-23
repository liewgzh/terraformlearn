terraform {
  backend "remote" {
    organization = "liewgzh_terraform"
    workspaces {
	name = "terraformlearn"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-01e3c4a339a264cc9" 
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0c683566256c48335"
  vpc_security_group_ids = ["sg-01bb4e176ad03b1ba"]

  tags = {
	Name = var.instance_name
  }
}
