resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.11.0/24"
    availability_zone = "${var.region}b"
    tags = {
      Name = "private-subnet"
    }
}