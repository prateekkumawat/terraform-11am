# create aws vpc resource 
resource "aws_vpc" "this1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "aws-vpc"
    createdby = "terraform"
  }
}

# crate aws subnet resource public-subnet
resource "aws_subnet" "thissubnet1" {
  vpc_id = aws_vpc.this1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "aws-vpc-publicsubnet1-az1"
    createdby = "terraform"
  }
}

# crate aws subnet resource private-subnet
resource "aws_subnet" "thissubnet2" {
  vpc_id = aws_vpc.this1.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "aws-vpc-privatesubnet1-az2"
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
  subnet_id = aws_subnet.thissubnet1.id
}