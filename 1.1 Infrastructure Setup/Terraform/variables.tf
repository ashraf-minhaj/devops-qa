variable "aws_region" {
  type = string
}

variable "component_prefix" {
  type    = string
  default = "devopsqa"
}

variable "component_postfix" {
  type        = string
  description = "environment slug, added at the end of every component name"
}

# VPC 
variable "vpc" {
  type    = string
  default = "vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones where resources will be deployed"
}

# RDS
variable "rds_storage" {
  type    = number
  default = 10
}

variable "rds_storage_type" {
  type    = string
  default = "gp2"
}

variable "rds_instance_class" {

}

variable "db_uname" {
  type      = string
  sensitive = true
}

variable "db_pass" {
  type      = string
  sensitive = true
}

# ec2
variable "ami_id" {
  type    = string
  default = "ami-12345678"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair."
  type        = string
  sensitive   = true
}