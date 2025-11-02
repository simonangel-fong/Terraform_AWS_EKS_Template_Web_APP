output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id_list" {
  value = [for subnet in aws_subnet.subnets : subnet.id]
}
