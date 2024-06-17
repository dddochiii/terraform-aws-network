## Subnet ##
resource "aws_subnet" "subnet_bak" {
  count = length(var.input_values)

  vpc_id            = var.vpc_id
  availability_zone = lookup(var.az, var.input_values[count.index][0], "Unknown AZ")
  cidr_block        = var.input_values[count.index][1]

  tags = {
    Name = join("-",[var.input_values[count.index][2],"subnet",substr(var.input_values[count.index][0],length(var.input_values[count.index][0])-1,1)])
  }
}