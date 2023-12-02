## Preview

![VPC GRAPH PREVIEW](/DOCS/graph.png "VPC Example")

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.gateway](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/internet_gateway) | resource |
| [aws_route_table.route](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/route_table) | resource |
| [aws_route_table_association.rta](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/route_table_association) | resource |
| [aws_security_group.sg_main](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress_rule](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_rule](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.sub](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route_config"></a> [route\_config](#input\_route\_config) | Route table | `string` | n/a | yes |
| <a name="input_sg_egress_rules"></a> [sg\_egress\_rules](#input\_sg\_egress\_rules) | Security group egress rule | <pre>list(object({<br>    rule_name        = string<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_sg_ingress_rules"></a> [sg\_ingress\_rules](#input\_sg\_ingress\_rules) | Security group ingress rule | <pre>list(object({<br>    rule_name   = string<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Security group's name | `string` | n/a | yes |
| <a name="input_vpc_configs"></a> [vpc\_configs](#input\_vpc\_configs) | VPC object configs | <pre>object({<br>    name = string<br>    cidr = string<br>    subnets = list(object({<br>      name     = string<br>      sub_cidr = string<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |

