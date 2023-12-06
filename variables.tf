# Define variables for the AWS provider
variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

# Define variables for the EC2 instance
variable "instance_count" {
  description = "The number of EC2 instances to create"
  default     = 1
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
  default     = "ami-0c2b8ca1dad447f8a"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  default     = "t2.micro"
}

variable "public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance"
  default     = true
}

variable "instance_name" {
  description = "The name tag for the EC2 instance"
  default     = "terraform-example"
}

# Define variables for the storage options
variable "root_volume_type" {
  description = "The volume type for the root device"
  default     = "gp2"
}

variable "root_volume_size" {
  description = "The volume size for the root device in GB"
  default     = 8
}

variable "ebs_device_name" {
  description = "The device name for the EBS volume"
  default     = "/dev/sdh"
}

variable "ebs_volume_type" {
  description = "The volume type for the EBS volume"
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "The volume size for the EBS volume in GB"
  default     = 10
}
