provider "aws" {
  region = var.region
}

# ✅ Fetch the latest Ubuntu AMI in the given region
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*64-generic"]
  }
}

# ✅ Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# ✅ Get the subnets in the default VPC that are public
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  # Optional: You can add this if your public subnets are tagged accordingly
  # filter {
  #   name   = "tag:Type"
  #   values = ["public"]
  # }
}

# ✅ Use a specific subnet from the list (e.g., first)
locals {
  selected_subnet_id = data.aws_subnets.public.ids[0]
}

# ✅ Master Node
resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = var.key_name
  subnet_id     = local.selected_subnet_id

  tags = {
    Name = "master"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}

# ✅ Worker Node 1
resource "aws_instance" "worker1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.key_name
  subnet_id     = local.selected_subnet_id

  tags = {
    Name = "w1"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}

# ✅ Worker Node 2
resource "aws_instance" "worker2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.key_name
  subnet_id     = local.selected_subnet_id

  tags = {
    Name = "w2"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
}
