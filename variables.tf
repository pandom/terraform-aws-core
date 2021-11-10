#region for deployment
variable "aws_region" {
    default = "ap-southeast-2"
    type = string
    description = "sydney, australia"
}
variable "aws_availability_zones" {
    type = list
    description = "ap-southeast-2 azs"
    default = ["apse2-az1", "apse2-az2", "apse2-az3"]

}


## VPC Variables

variable "vpc_name" {
    type = string
    description = "VPC name"
    default = "main vpc"
  
}

variable "vpc_cidr" {
    type = string
    description = "must contain private/public subnets within"
    default = "10.0.0.0/16"
}
variable "vpc_private_subnets" {
    type = list
    description = "private subnets"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
}

variable "vpc_public_subnets" {
    type = list
    description = "public subnets"
    default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}