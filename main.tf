# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Create a subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr # You can modify the subnet CIDR here
}

# Create a security group
resource "aws_security_group" "main" {
  name   = "terraform-example"
  vpc_id = aws_vpc.main.id

  # Allow SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "main" {
  count                       = var.instance_count # You can modify the number of instances here
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = var.public_ip # You can enable or disable auto-assign public IP address here
  tags = {
    Name = var.instance_name # You can modify the name of the instances here
  }

  # You can configure the storage options here
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }

  ebs_block_device {
    device_name = var.ebs_device_name
    volume_type = var.ebs_volume_type
    volume_size = var.ebs_volume_size
  }
}
