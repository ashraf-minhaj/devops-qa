resource "aws_instance" "ec2_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnets[0].id
  key_name        = var.key_name
  security_groups = [aws_security_group.ec2_security_group.id]

  tags = {
    Name = local.ec2_name
    app  = "${var.component_prefix}"
    env  = "${var.component_postfix}"
  }
}