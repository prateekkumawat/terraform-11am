#  terraform plan -var-file=".\tfvars\apsouth2.tfvars"
#  terraform apply -var-file=".\tfvars\apsouth2.tfvars"
aws_region = "ap-south-2"
vpc_cidr_block = "10.0.0.0/16"
aws_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
aws_subnet_az = ["ap-south-2a", "ap-south-2b"]
aws_ami = "ami-07f0dc6c4fe353ff1"
aws_instance_type = "t3.micro"