variable "vpc_id" {
    type = string
}

variable "az" {
    type = map
    default = {
        an2a = "ap-northeast-2a",
        an2b = "ap-northeast-2b",
        an2c = "ap-northeast-2c",
        an2d = "ap-northeast-2d"
    }
}

variable "input_values" {
    type = list(any)
}