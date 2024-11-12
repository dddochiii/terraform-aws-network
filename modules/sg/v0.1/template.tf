## Security Group ##
resource "aws_security_group" "sg" {
    name = join("-",[var.sg_purpose, "sg"])
    description = join(" ",["Security Group for Access Management about",upper(var.sg_purpose)])
    vpc_id = var.vpc_id

    dynamic ingress {
        for_each = var.ingress_rule
        
        content {
            description = ingress.value[3]
            from_port = ingress.value[1]
            to_port = ingress.value[1]
            protocol = ingress.value[0]
            cidr_blocks = [ingress.value[2]]
        }        
    }

    dynamic egress {
        for_each = var.egress_rule
        
        content {
            description = egress.value[3]
            from_port = egress.value[1]
            to_port = egress.value[1]
            protocol = egress.value[0]
            cidr_blocks = [egress.value[2]]
        }        
    }

    tags = {
        Name = join("-",[var.sg_purpose, "sg"])
    }
}