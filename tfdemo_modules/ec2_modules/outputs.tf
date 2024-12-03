output "instance_public_ip" {
  value = aws_instance.tfdemo_server.public_ip
}
