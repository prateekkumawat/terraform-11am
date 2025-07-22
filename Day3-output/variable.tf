variable "aws_region"{}
variable "vpc_cidr_block" {
  type = string
}
variable "aws_subnet_cidr" {
  type = list 
}
variable "aws_subnet_az" {
  type = list
}
variable "aws_ami" {}
variable "aws_instance_type" {}