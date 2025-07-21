resource "aws_vpc" "this1" {
  cidr_block =  var.vpc_cidr_block
  tags = {
    Name = "aws-vpc"
    createdby = "terraform"
  }
}

resource "aws_subnet" "publicsubnet" {
  cidr_block = var.aws_subnet_cidr[0]
  availability_zone = var.aws_subnet_az[0]
  vpc_id = aws_vpc.this1.id
   tags = {
    Name = "aws-vpc-public-subnet"
    createdby = "terraform"
  }
}

resource "aws_subnet" "privatesubnet" {
  cidr_block = var.aws_subnet_cidr[1]
  availability_zone = var.aws_subnet_az[1]
  vpc_id = aws_vpc.this1.id
   tags = {
    Name = "aws-vpc-private-subnet"
    createdby = "terraform"
  }
}

# crate a internetgateway 
resource "aws_internet_gateway" "this1igw" {
  vpc_id = aws_vpc.this1.id 
  tags = {
    Name = "aws_vpc_igw"
    createdby = "terraform"
  }
}


# create route table for public
resource "aws_route_table" "this1pubrt" {
  vpc_id = aws_vpc.this1.id 
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this1igw.id
  }
  tags = {
    Name = "aws_vpc_public-rt"
    createdby = "terraform"
  }
}

# route table assosiation 
resource "aws_route_table_association" "this1pubrtassosiate1" {
  route_table_id = aws_route_table.this1pubrt.id
  subnet_id = aws_subnet.publicsubnet.id
}

resource "aws_security_group" "thisins1sg" {
  vpc_id = aws_vpc.this1.id
  name = "aws-security-group-ins"
  description = "aws security group"
  ingress {
    from_port     = 22
    to_port       = 22
    protocol      = "TCP"
    cidr_blocks    = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]  
}
}

resource "aws_instance" "this1newpubins" {
  ami = var.aws_ami
  instance_type = var.aws_instance_type
  vpc_security_group_ids = [aws_security_group.thisins1sg.id]
  subnet_id = aws_subnet.privatesubnet.id
  key_name = "kubeserver.pem"
  tags = {
    Name = "aws_instnace-public"
    createdby = "terraform"
  }
}