output vpc_id {
  value = module.vpc.vpc_id
}

output private_subnets {
  value = module.vpc.private_subnets
}

output public_subnets {
  value = module.vpc.public_subnets
}

output security_group_ssh {
  value = module.security_group_ssh.this_security_group_id
}

output security_group_outbound {
  value = module.security_group_outbound.this_security_group_id
}
