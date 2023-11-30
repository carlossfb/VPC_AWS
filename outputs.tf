output "subnet_id" {
 value = { for key, subnet in aws_subnet.sub : key => subnet.id }
}
output "security_group_id" {
  value = aws_security_group.sg_main.id
}