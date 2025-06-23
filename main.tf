terraform {
  backend "remote" {
    organization = "liewgzh_terraform"
    workspaces {
	name = "fdm_cloud_proj"
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
  subnet_id              = "subnet-05b94149072246d6c"
  vpc_security_group_ids = ["sg-07cc731212955ff62"]

  tags = {
	Name = var.instance_name
  }
}
