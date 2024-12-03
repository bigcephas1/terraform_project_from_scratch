# output "instance_public_ip" {
#   value = module.tfdemo_ec2.instance_public_ip.public_ip
# }
output "instance_public_ip" {
  value = module.tfdemo_server.instance_public_ip
}
