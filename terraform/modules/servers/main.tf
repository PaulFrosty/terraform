resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.public_sg_id
  subnet_id              = var.public_subnet_ids
  key_name               = var.key_name
  tags = {
    Name = "Bastion_server"
  }
}


resource "aws_instance" "private" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.private_sg_id
  subnet_id              = var.private_subnet_ids
  key_name               = var.key_name
  tags = {
    Name = "Private_server"
  }
}
