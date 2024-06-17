variable "vpc_id" {
    type = string
}

variable "vpce_service" {
    type = string
}

variable "type" {
    type = string
    default = "Interface"
}

variable "subnet_filter" {
    type = string
}

variable "vpce_sg_ids" {
    type = list
}