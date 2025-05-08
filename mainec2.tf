

provider "aws" {
  region     = "ap-south-2"
}
resource "aws_instance" "master" {
ami = "ami-053a0835435bf4f45"
instance_type = "t3.medium"
# SSH key pair
  key_name = "hydra"
subnet_id     = "subnet-05af2e62e57061103"
tags= {
Name= "master"
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
resource "aws_instance" "worker1" {
ami = "ami-053a0835435bf4f45"
instance_type = "t3.micro"
# SSH key pair
  key_name = "hydra"
subnet_id     = "subnet-05af2e62e57061103"
tags= {
Name= "w1"
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
resource "aws_instance" "worker2" {
ami = "ami-053a0835435bf4f45"
instance_type = "t3.micro"
# SSH key pair
  key_name = "hydra"
subnet_id     = "subnet-05af2e62e57061103"
tags= {
Name= "w2"
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
output "masterp_ip" {
  value = aws_instance.master.private_ip
}
output "master_ip" {
  value = aws_instance.master.public_ip
}
output "worker1_ip" {
  value = aws_instance.worker1.public_ip
}
output "worker2_ip" {
  value = aws_instance.worker2.public_ip
}
