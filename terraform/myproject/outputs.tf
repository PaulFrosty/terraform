output "dev_public_subnet_ids" {
  value = module.vpc_dev.public_subnet_ids
}

output "dev_private_subnet_ids" {
  value = module.vpc_dev.private_subnet_ids
}
