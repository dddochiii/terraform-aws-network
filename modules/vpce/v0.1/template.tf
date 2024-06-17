data "aws_region" "current" {}

data "aws_subnet_ids" "subnets" {
  vpc_id = var.vpc_id
  
  filter {
    name   = "tag:Name"
    values = [var.subnet_filter]
  }
}

resource "aws_vpc_endpoint" "vpce" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${data.aws_region.current}.${var.vpce_service}"
  vpc_endpoint_type = var.type

  subnet_ids = [data.aws_subnet_ids.ids]

  security_group_ids = var.vpce_sg_ids

  private_dns_enabled = true

  tags = {
    Name = join("-",["vpce", var.vpce_service])
  }
}