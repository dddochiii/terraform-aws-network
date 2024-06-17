## Security Group ##
resource "aws_security_group" "sg" {
    name = join("-",["sg", var.sg_purpose])
    description = join(" ",["Security Group for Access Management about",upper(var.sg_purpose)])
    vpc_id = var.vpc_id

    dynamic ingress {
        count = length(var.ingress_rule)
        
        protocol = var.ingress_rule[count.index][0]
        from_port = var.ingress_rule[count.index][1]
        to_port = var.ingress_rule[count.index][1]
        cidr_blocks = [regex("^(([1-9]?\\d|1\\d{2}|2([0-4]\\d)|25[0-5])\\.){3}([1-9]?\\d|1\\d{2}|2([0-4]\\d)|25[0-5])$", var.ingress_rule[count.index][2])]
        security_groups = [regex("^sg-[1-9a-z]{17}$", var.ingress_rule[count.index][2])]
        description = var.ingress_rule[count.index][3]
    }

    dynamic egress {
        count = length(var.egress_rule)
        
        protocol = var.ingress_rule[count.index][0]
        from_port = var.ingress_rule[count.index][1]
        to_port = var.ingress_rule[count.index][1]
        cidr_blocks = [regex("^(([1-9]?\\d|1\\d{2}|2([0-4]\\d)|25[0-5])\\.){3}([1-9]?\\d|1\\d{2}|2([0-4]\\d)|25[0-5])$", var.ingress_rule[count.index][2])]
        security_groups = [regex("^sg-[1-9a-z]{17}$", var.ingress_rule[count.index][2])]
        description = var.ingress_rule[count.index][3]
    }

    tags = {
        Name = join("-",["sg", var.sg_purpose])
    }
}