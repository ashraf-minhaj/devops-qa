resource "aws_db_subnet_group" "db_subnet_group" {
  name       = local.db_sub_grp
  subnet_ids = aws_subnet.private_subnets[*].id
  tags = {
    Name = local.db_sub_grp
    app  = "${var.component_prefix}"
    env  = "${var.component_postfix}"
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage      = var.rds_storage
  storage_type           = var.rds_storage_type
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = var.rds_instance_class
  identifier             = local.db_name
  username               = var.db_uname
  password               = var.db_pass
  multi_az               = false
  publicly_accessible    = false
  skip_final_snapshot    = true
  parameter_group_name   = "default.postgres15"
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    app = "${var.component_prefix}"
    env = "${var.component_postfix}"
  }
}