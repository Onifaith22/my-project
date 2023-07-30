resource "aws_subnet" "capstone-private-1a" {
  vpc_id            = aws_vpc.capstone.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "eu-north-1a"

  tags = {
    "Name"                            = "capstone-private-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "capstone-private--1b" {
  vpc_id            = aws_vpc.capstone.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "eu-north-1b"

  tags = {
    "Name"                            = "capstone-private-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "capstone-public-1a" {
  vpc_id                  = aws_vpc.capstone.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "capstone-public-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "capstone-public-1b" {
  vpc_id                  = aws_vpc.capstone.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "capstone-public-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
