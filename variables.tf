
variable "vpc_configs" {
  type = object({
    name = string
    cidr = string
    subnets = list(object({
      name     = string
      sub_cidr = string
    }))
  })
  description = "VPC object configs"
}

variable "route_config" {
  type        = string
  description = "Route table"
}

variable "sg_name" {
  type        = string
  description = "Security group's name"
}

variable "sg_ingress_rules" {
  type = list(object({
    rule_name   = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Security group ingress rule"
}

variable "sg_egress_rules" {
  type = list(object({
    rule_name        = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
  }))
  description = "Security group egress rule"
}
