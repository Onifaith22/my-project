resource "aws_eip" "capstone-nat" {
  vpc = true

  tags = {
    Name = "capstone-nat"
  }
}

resource "aws_nat_gateway" "capstone-nat" {
  allocation_id = aws_eip.capstone-nat.id
  subnet_id     = aws_subnet.capstone-public-1a.id

  tags = {
    Name = "capstone-nat"
  }

  depends_on = [aws_internet_gateway.capstone-igw]
}