provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "master" {
ami = "ami-0dee22c13ea7a9a67"

# SSH key pair
  key_name = "awskp"

   instance_type = t2.medium
tags= {
Name= kube-m
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
resource "aws_instance" "worker1" {
ami = "ami-0dee22c13ea7a9a67"

# SSH key pair
  key_name = "awskp"

   instance_type = t2.medium
tags= {
Name= kube-w1
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
resource "aws_instance" "worker2" {
ami = "ami-0dee22c13ea7a9a67"

# SSH key pair
  key_name = "awskp"

   instance_type = t2.medium
tags= {
Name= kube-w2
}
# Block device mapping for the EBS volume
  root_block_device {
    volume_size = 20  # Size in GB
    volume_type = "gp2"  # General Purpose SSD
  }
}
output "instances_ip" {
  value = aws_instance.master.public_ip
  value = aws_instance.worker1.public_ip
  value = aws_instance.worker2.public_ip
}
