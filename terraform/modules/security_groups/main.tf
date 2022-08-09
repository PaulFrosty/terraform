resource "aws_security_group" "public" {
  name = "Public Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Public SecurityGroup"
  }
}

resource "aws_security_group" "private" {
  name = "Private Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Private SecurityGroup"
  }
}


resource "aws_security_group" "rds" {
  name = "RDS Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["22", "5432"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
    }
  }

  tags = {
    Name  = "RDS SecurityGroup"
  }
}
