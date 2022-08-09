variable "instance_class" {
  default = "db.t3.micro"
}

variable "allocated_storage" {
  default = 20
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "10.17"
}

variable "master_username" {
  default = "postgres"
}

variable "master_password" {
  default = "data1996"
}

variable "rds_sg_id" {}

variable "private_subnet_ids" {}
