## EIP ##
resource "aws_eip" "eip" {
    count = var.public_yn ? 1 : 0

    domain = "vpc"
    public_ipv4_pool = "amazon"

    tags = {
        Name      = join("-",[var.nat_purpose,"eip"])
    }
}

## Finding Attached Internet Gateway at VPC ##
data "aws_subnet" "subnet" {
  id = var.nat_subnet_id
}

data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = data.aws_subnet.subnet.vpc_id
  }
}

## NAT Gateway ##
resource "aws_nat_gateway" "nat" {
  connectivity_type = var.public_yn ? "public" : "private"

  dynamic "public_yn" {
    count = var.public_yn ? 1 : 0
    content {
      allocation_id = aws_eip.eip.id
    }    
  }

  subnet_id     = var.nat_subnet_id

  tags = {
    Name      = join("-",[var.nat_purpose,"nat",substr(data.aws_subnet.subnet.availability_zone, length(data.aws_subnet.subnet.availability_zone)-1, 1)])
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [
    data.aws_internet_gateway.igw,
    aws_eip.eip
  ]
}