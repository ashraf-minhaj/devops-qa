resource "aws_security_group" "ec2_security_group" {
  name   = local.ec2_sg_name
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = [80, 22]
    iterator = port
    content {
      description = port.value == 22 ? "Allow inbound SSH traffic" : "Allow inbound HTTP traffic"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = local.ec2_sg_name
    app  = "${var.component_prefix}"
    env  = "${var.component_postfix}"
  }
}


resource "aws_security_group" "db_security_group" {
  name   = local.db_sg_name
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    description     = "PostgreSQL"
    security_groups = [aws_security_group.ec2_security_group.id] # allow ec2 instance to access rds
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = local.db_sg_name
    app  = "${var.component_prefix}"
    env  = "${var.component_postfix}"
  }
}