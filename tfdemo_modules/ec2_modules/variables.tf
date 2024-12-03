
variable "avail_zones" {
  description = "value for availability zone"
  type        = string
}
variable "ingress_sg_cidr_block" {
  description = "ingress sg value"
  type = string
}
variable "instance_type" {
  description = "type of instance for tfdemo server"
  type = string
}
locals {
  prefix = terraform.workspace
}
variable "vpc_id" {
  description = "value for vpc_id"
  type = string
}
variable "subnet_id" {
  description = "value for subnet"
}
 