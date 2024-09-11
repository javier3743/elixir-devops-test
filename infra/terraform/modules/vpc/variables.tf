variable "region" {
    type = string
    description = "AWS region"
}
variable "vpc_cidr" {
    type = string
    description = "VPC CIDR"
}
variable "availability_zones" {
    type = list(string)
    description = "Availability zones"
}
variable "public_subnet_cidrs" {
    type = list(string)
    description = "Public subnet cidrs"
}
variable "private_subnet_cidrs" {
    type = list(string)
    description = "Private subnet cidrs"
}