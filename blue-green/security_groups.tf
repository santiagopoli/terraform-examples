resource "aws_security_group" "terraform-blue-green" {
  description = "Terraform Blue/Green"
  vpc_id      = "${var.vpc_id}"
  name        = "terraform-blue-green-v${var.infrastructure_version}"

  tags {
    Name = "Terraform Blue/Green (v${var.infrastructure_version})"
  }
}

resource "aws_security_group_rule" "terraform-blue-green-inbound" {
  type              = "ingress"
  security_group_id = "${aws_security_group.terraform-blue-green.id}"
  from_port         = -1
  to_port           = 0
  protocol          = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "terraform-blue-green-outbound" {
  type              = "egress"
  security_group_id = "${aws_security_group.terraform-blue-green.id}"
  from_port         = -1
  to_port           = 0
  protocol          = "-1"

  cidr_blocks = ["0.0.0.0/0"]
}
