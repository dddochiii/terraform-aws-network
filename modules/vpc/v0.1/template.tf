## VPC ##
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name      = join("-", [vpc_purpose,"vpc"])
  }
}

## Internet Gateway ##
# If you want to create Internet Gateway on this VPC, You should input "y" to "attach_igw" variable.
resource "aws_internet_gateway" "igw" {
  count = var.attach_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name      = join("-",[join("-", [vpc_purpose,"vpc"]),"igw"])
  }
}
