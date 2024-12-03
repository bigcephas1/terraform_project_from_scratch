
provider "aws" {
  region = "eu-north-1"

}
locals {
  prefix = terraform.workspace
}

resource "aws_vpc" "tfdemo_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${local.prefix}-vpc"
  }
}

module "subnet" {
  source                 = "./tfdemo_modules/subnet_module"
  vpc_id                 = aws_vpc.tfdemo_vpc.id
  subnet_cidr_block      = var.subnet_cidr_block
  avail_zones            = var.avail_zones
  route_table_cidr_block = var.route_table_cidr_block
}

module "tfdemo_server" {
  source                = "./tfdemo_modules/ec2_modules"
  ingress_sg_cidr_block = var.ingress_sg_cidr_block
  avail_zones           = var.avail_zones
  instance_type         = var.instance_type
  vpc_id                = aws_vpc.tfdemo_vpc.id
  subnet_id             =  module.subnet.subnet_id
  
}