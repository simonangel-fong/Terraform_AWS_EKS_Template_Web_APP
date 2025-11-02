# ##############################
# VPC
# ##############################
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc_name
  }
}

# ##############################
# Subnet
# ##############################

resource "aws_subnet" "subnets" {
  for_each = var.vpc_subnet

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = "${var.aws_region}${each.value.az_suffix}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-${var.app}-${var.env}-${each.value.subnet_name}-${each.value.az_suffix}"
  }
}

# ##############################
# Internet Gateway
# ##############################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-${var.app}-${var.env}-igw"
  }
}

# ##############################
# Route Table
# ##############################
resource "aws_route_table" "main_rt_public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project}-${var.app}-${var.env}-route-table"
  }
}

# ##############################
# Route Table Associations
# ##############################
resource "aws_route_table_association" "public_assoc" {
  for_each       = var.vpc_subnet
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.main_rt_public.id
}
