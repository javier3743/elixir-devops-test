output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = { for cidr, subnet in aws_subnet.public : cidr => subnet.id }
}

output "private_subnet_ids" {
  value = { for cidr, subnet in aws_subnet.private : cidr => subnet.id }
}