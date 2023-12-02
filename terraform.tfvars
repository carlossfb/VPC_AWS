##################################################################
#_____ NETWORK __________________________________________________#
##################################################################
vpc_configs = {
  name = "my_vpc"
  cidr = "10.0.0.0/16"
  subnets = [
    {
      name     = "1"
      sub_cidr = "10.0.1.0/24"
    },
    {
      name     = "2"
      sub_cidr = "10.0.2.0/24"
    }

  ]
}


route_config = "0.0.0.0/0"

##################################################################
#_____ SECURITY _________________________________________________#
##################################################################

sg_name = "security-group-dev"

sg_ingress_rules = [
  {
    rule_name   = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["138.36.57.25/32"]
  },
  {
    rule_name   = "zabbix-nginx"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["138.36.57.25/32"]
  },
  {
    rule_name   = "zabbix-apache"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["138.36.57.25/32"]
  }
]

sg_egress_rules = [
  {
    rule_name        = "default"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
]
