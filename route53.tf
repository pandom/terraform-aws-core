data "aws_route53_zone" "main" {
  name = "hashidemos.io"
}

# AWS SUBZONE

resource "aws_route53_zone" "aws_sub_zone" {
  name    = "burkey.hashidemos.io"
  comment = "Managed by Terraform, Delegated Sub Zone for AWS for burkey.hashidemos.io"

  tags = {
    name       = "burkey"
    owner      = "burkey"
    created-by = "burkey"
    ttl        = "-1"
  }
}

# resource "aws_route53_record" "aws_sub_zone_ns" {
#   zone_id = data.aws_route53_zone.main.zone_id
#   name    = "burkey.hashidemos.io"
#   type    = "NS"
#   ttl     = "30"

#   records = [
#     for awsns in aws_route53_zone.aws_sub_zone.name_servers :
#     awsns
#   ]
# }