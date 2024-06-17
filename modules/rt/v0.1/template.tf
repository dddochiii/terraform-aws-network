data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_vpn_gateway" "vgw" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

## Route Table ##
resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  dynamic route {
    count = var.routing_rule

    cidr_block = var.routing_rule[count.index][0]
    gateway_id = var.routing_rule[count.index][1]=="igw" ? data.aws_internet_gateway.igw.id : var.routing_rule[count.index][1]=="vgw" ? data.aws_vpn_gateway.vgw.id : var.routing_rule[count.index][1]
  }  

  tags = {
    Name = join("-",[var.rt_purpose,"rt"])
  }
}

data "aws_route_tables" "route_table_ids" {
    vpc_id = var.vpc_id

    filter {    
        name = "tag:Name"
        values = ["*${var.rt_filter}*"]
    }
}

## Route Table Association ##
resource "aws_route_table_association" "rt_association" {
    count = length(data.aws_route_table.route_table_ids)

    subnet_id = data.aws_route_tables.route_table_ids[count.index]
    route_table_id = aws_route_table.rt.id
}