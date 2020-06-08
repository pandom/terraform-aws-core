data aws_availability_zones "this" {
  state = "available"
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

  ingress_cidr_blocks = [
    "220.235.151.137/32",
    "10.0.0.0/16"
  ]
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


