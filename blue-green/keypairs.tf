resource "aws_key_pair" "terraform-blue-green" {
  key_name   = "terraform-blue-green-v${var.infrastructure_version}"
  public_key = "${file("keypairs/keypair.pub")}"
}
