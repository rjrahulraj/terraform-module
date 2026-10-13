variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "availability_zone" {
  type    = string
  default = "eu-west-1a"
}
