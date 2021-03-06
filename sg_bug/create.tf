resource "aws_security_group" "yak-deleterious" {
  name        = "yak-deleterious"
}

resource "aws_security_group_rule" "ingress" {
  security_group_id = "${aws_security_group.yak-deleterious.id}"
  type        = "ingress"
  from_port   = 8000
  to_port     = 8000
  protocol    = "tcp"
  cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
}

resource "aws_security_group_rule" "ingress_2" {
  security_group_id = "${aws_security_group.yak-deleterious.id}"
  type        = "ingress"
  from_port   = 448
  to_port     = 531
  protocol    = "udp"
  ipv6_cidr_blocks = ["2002:db8::/48"]
  self = true
}

output "sg_id" {
  value = "${aws_security_group.yak-deleterious.id}"
}
