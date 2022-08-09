resource "aws_db_subnet_group" "postgres" {
  name       = "postgres"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "Postgres"
  }
}

resource "aws_db_parameter_group" "postgres" {
  name   = "postgres"
  family = "postgres10"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "postgres"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  username               = var.master_username
  password               = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = var.rds_sg_id
  parameter_group_name   = aws_db_parameter_group.postgres.name
  publicly_accessible    = true
  skip_final_snapshot    = true
  multi_az               = true
}
