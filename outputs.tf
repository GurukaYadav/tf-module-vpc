output "VPC_ID" {
  value = aws_vpc.main.id
}

output "PRIVATE_SUBNET_ID" {
  value = aws_subnet.private.*.id
}



