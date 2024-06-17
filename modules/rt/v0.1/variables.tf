variable "rt_purpose" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "routing_rule" {
    type = list(any)
}

variable "rt_filter" {
    type = string
}