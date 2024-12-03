data "aws_ami" "tfdemo_server_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Ubuntu*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
