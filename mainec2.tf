variable "elb-names" {
  type = list
  default = ["Team3-kuber-master", "Team3-kuber-n1","Team3-Kuber-n2"]
}

variable "list" {
  type = list
  default = ["t2.medium","t2.medium","t2.medium"]
}


provider "aws" {
  region     = "us-east-1"
#  version = "5.60.0"
# access_key = "PUT-YOUR-ACCESS-KEY-HERE"
# secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "Team3-proj" {
ami = "ami-0e86e20dae9224db8"
count= 3

   instance_type = var.list[count.index]
tags= {
Name= var.elb-names[count.index]
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
output "instances_ip" {
  value = aws_instance.Team3-proj[*].public_ip
}
