resource "aws_route_table" "private-table" {
  vpc_id = aws_vpc.capstone.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.capstone-nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private-table"
  }
}

resource "aws_route_table" "public-table" {
  vpc_id = aws_vpc.capstone.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.capstone-igw.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public-table"
  }
}
resource "aws_route_table_association" "capstone-private-1a" {
  subnet_id      = aws_subnet.capstone-private-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "capstone-private-1b" {
  subnet_id      = aws_subnet.capstone-private-1b.id
  route_table_id = aws_route_table.private-table.id
}

resource "aws_route_table_association" "capstone-public-1a" {
  subnet_id      = aws_subnet.capstone-public-1a.id
  route_table_id = aws_route_table.public-table.id
}

resource "aws_route_table_association" "capstone-public-1b" {
  subnet_id      = aws_subnet.capstone-public-1b.id
  route_table_id = aws_route_table.public-table.id
}

