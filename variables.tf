variable tags {
  type = map
  default = {
    TTL   = "48"
    owner = "Burkey"
    delete = false
  }
}
#Test
variable public_subnets {
  type = list
  default = [
    "10.10.111.0/24",
    "10.10.112.0/24",
    "10.10.113.0/24"
  ]
}

variable private_subnets {
  type = list
  default = [
    "10.10.11.0/24",
    "10.10.21.0/24",
    "10.10.31.0/24"
  ]
}

variable vpc_cidr {
  type = string
  default = "10.10.0.0/16"
}

variable my_cidr {
  type = list
  default = []
}

variable sub_zone {
  type= list
  default = []
}
variable ssh_public_key {
  type = string
}