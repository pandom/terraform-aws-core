locals {
  my_ip = format("%s/32", data.http.this.body)
}

data aws_availability_zones "this" {
  state = "available"
}

data http "this" {
  url = "https://ipv4bot.whatismyipaddress.com"
  request_headers = {
    Accept = "application/json"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "core"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.this.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = var.tags
}

module "security_group_ssh" {
  source  = "terraform-aws-modules/security-group/aws"

  name        = "ssh"
  description = "SSH access"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [local.my_ip]
  ingress_rules = ["ssh-tcp"]
  tags = var.tags
}

module "security_group_outbound" {
  source  = "terraform-aws-modules/security-group/aws"

  name        = "outbound"
  description = "outbound access"
  vpc_id      = module.vpc.vpc_id

  egress_rules = ["all-all"]
  tags = var.tags
}


