module "security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "2.11.0"

  name        = "test"
  description = "Security group to allow web, ssh and ICMP"
  vpc_id      = "${aws_vpc.default.id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}