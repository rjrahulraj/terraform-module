module "vpc" {
  source = "../../modules/vpc"

  name               = "dev"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "security_group" {
  source = "../../modules/security_group"

  name   = "dev"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source             = "../../modules/ec2"
  name               = "dev-web-server"
  ami_id             = data.aws_ami.amazon_linux.id
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.security_group.security_group_id]
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = "my-unique-dev-bucket-name"
}