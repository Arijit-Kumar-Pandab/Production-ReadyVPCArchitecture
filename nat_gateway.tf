resource "aws_eip" "main_epi" {
  domain = "vpc"
  tags = {
    Name = "main-eip"
  }
}

resource "aws_nat_gateway" "main_natgw" {
  allocation_id = aws_eip.main_epi.id

  subnet_id = aws_subnet.this[keys(local.public_subnets)[0]].id

  tags = {
    Name = "main-natgw"
  }
}