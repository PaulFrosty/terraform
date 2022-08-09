output "bastion_server_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "private_server_private_ip" {
  value = aws_instance.private.private_ip
}
