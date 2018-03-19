resource "aws_elb" "terraform-blue-green" {
  name            = "terraform-blue-green-v${var.infrastructure_version}"
  subnets         = ["${aws_subnet.terraform-blue-green.*.id}"]
  security_groups = ["${aws_security_group.terraform-blue-green.id}"]

  instances = ["${aws_instance.terraform-blue-green.*.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags {
    Name = "terraform-blue-green-v${var.infrastructure_version}"
  }
}

output "load_balancer_dns" {
  value = "${aws_elb.terraform-blue-green.dns_name}"
}
