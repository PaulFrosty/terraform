provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "mybucket-trainee-15" // Bucket where to SAVE Terraform State
    key    = "myproject/terraform.tfstate"             // Object name in the bucket to SAVE Terraform State
    region = "eu-central-1"                                 // Region where bycket created
  }
}


module "vpc_dev" {
  source = "../modules/network"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var. public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  env = var.env
}

module "sg" {
  source = "../modules/security_groups"
  vpc_id          = module.vpc_dev.vpc_id
  vpc_cidr        = module.vpc_dev.vpc_cidr

  depends_on	= [module.vpc_dev]
}

module "servers" {
  source = "../modules/servers"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  public_subnet_ids             = module.vpc_dev.public_subnet_ids
  private_subnet_ids            = module.vpc_dev.private_subnet_ids
  public_sg_id                  = module.sg.public_sg_id
  private_sg_id                 = module.sg.private_sg_id

  depends_on	= [module.sg]
}

module "rds" {
  source = "../modules/rds"
  rds_sg_id                    = module.sg.rds_sg_id
  private_subnet_ids           = module.vpc_dev.private_subnet_ids
  depends_on	= [module.servers]
}
