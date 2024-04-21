# state.tf defines my resources
# creat a vpc
resource "aws_vpc" "cooper_vpc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "Cooper_VPC"
  }
}

# create a public subnet
resource "aws_subnet" "Cooper_Pub1" {
  vpc_id     = aws_vpc.cooper_vpc.id
  cidr_block = "20.0.1.0/24"

  tags = {
    Name = "Cooper_PUB1"
  }
}

resource "aws_subnet" "Cooper_Pub2" {
  vpc_id     = aws_vpc.cooper_vpc.id
  cidr_block = "20.0.3.0/24"

  tags = {
    Name = "Cooper_PUB2"
  }
}

# create a private subnet
resource "aws_subnet" "Cooper_Privt1" {
  vpc_id     = aws_vpc.cooper_vpc.id
  cidr_block = "20.0.2.0/24"

  tags = {
    Name = "Cooper_Prit1"
  }
}

# create a Private subnet
resource "aws_subnet" "Cooper_Prt1" {
  vpc_id     = aws_vpc.cooper_vpc.id
  cidr_block = "20.0.4.0/24"

  tags = {
    Name = "Cooper_PRT1"
  }
}

# create IGW
resource "aws_internet_gateway" "cooper_igw" {
  vpc_id = aws_vpc.cooper_vpc.id
}

#create a routable
resource "aws_route_table" "Cooper_RT" {
  vpc_id = aws_vpc.cooper_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cooper_igw.id
  }
}

#create a route table association for public subnet
resource "aws_route_table_association" "Cooper_RtA" {
  subnet_id      = aws_subnet.Cooper_Pub1.id
  route_table_id = aws_route_table.Cooper_RT.id
}

resource "aws_route_table_association" "cooper_Pub_Rta" {
  subnet_id      = aws_subnet.Cooper_Pub2.id
  route_table_id = aws_route_table.Cooper_RT.id
}

