variable "region" {
  description = "AWS Region where to provision VPC Network"
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type        = string
}

variable "env" {
  default = "dev"
  type = string
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24"
  ]
  type        = list
}

variable "private_subnet_cidrs" {
  default = [
    "10.0.11.0/24",
    "10.0.22.0/24"
  ]
  type        = list
}


variable "ami" {
  default = "ami-012ae45a4a2d92750"
  type = string
}

variable "instance_type" {
  default = "t3.micro"
  type = string
}

variable "key_name" {
  default = "stockholm-playsdev"
  type = string
}


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
