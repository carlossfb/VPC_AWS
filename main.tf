################################################################## 
#_____ NETWORK __________________________________________________#
##################################################################
resource "aws_vpc" "main" {
  cidr_block = var.vpc_configs.cidr
  tags = {
    Name = var.vpc_configs.name
  }
}

resource "aws_subnet" "sub" {
  for_each   = { for subnet in var.vpc_configs.subnets : subnet.name => subnet }
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.sub_cidr

  tags = {
    Name = "subnet-${var.vpc_configs.name}-${each.value.name}"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ig-${var.vpc_configs.name}"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.route_config
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "rt-${var.vpc_configs.name}"
  }
}

resource "aws_route_table_association" "rta" {
  for_each       = { for subnet in var.vpc_configs.subnets : subnet.name => subnet }
  subnet_id      = aws_subnet.sub[each.value.name].id
  route_table_id = aws_route_table.route.id
}

##################################################################
#_____ SECURITY _________________________________________________#
##################################################################

resource "aws_security_group" "sg_main" {
  name   = var.sg_name
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group_rule" "ingress_rule" {
  for_each = { for n in var.sg_ingress_rules : n.rule_name => n }

  type        = "ingress"
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = each.value.cidr_blocks

  security_group_id = aws_security_group.sg_main.id
}

resource "aws_security_group_rule" "egress_rule" {
  for_each = { for n in var.sg_egress_rules : n.rule_name => n }

  type        = "egress"
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = each.value.cidr_blocks

  security_group_id = aws_security_group.sg_main.id
}
