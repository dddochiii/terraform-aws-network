variable "vpc_id" {
    type = string
}

variable "sg_purpose" { 
    type = string
}

variable "ingress_rule" {
    type = list(any)
}

variable "egress_rule" {
    type = list(any)
}