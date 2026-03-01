resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id = aws_vpc.main.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.key
    type = each.value.type
  }
}

locals {
  public_subnets = {
    for k, v in var.subnets : k => v if v.type == "public"
  }

  private_subnets = {
    for k, v in var.subnets : k => v if v.type == "private"
  }
}

locals {
  public_subnet_ids = [
    for k in keys(local.public_subnets) : aws_subnet.this[k].id
  ]
}

locals {
  private_subnet_ids = [
    for k in keys(local.private_subnets) : aws_subnet.this[k].id
  ]
}