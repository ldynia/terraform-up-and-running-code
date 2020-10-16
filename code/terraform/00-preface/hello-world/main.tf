# links: https://www.terraform.io/docs/configuration/resources.html
terraform {
  required_version = ">= 0.13, < 0.14"
}

provider "aws" {
  region = "us-east-2"
  version = "~> 2.0"
}

variable ect_instances_count {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  count = var.ect_instances_count
  
  tags = {
    Name = "hello world ${count.index}"
    Environment = "development"
    Key = "value"
  }
  
  lifecycle {
    # prevent_destroy = true
    prevent_destroy = false
  } 
}

