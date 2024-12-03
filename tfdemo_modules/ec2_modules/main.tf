
resource "aws_security_group" "tfdemo_sg" {
    vpc_id = var.vpc_id
    name = "tfdemo_sg"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.ingress_sg_cidr_block]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = [var.ingress_sg_cidr_block]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.ingress_sg_cidr_block]
        prefix_list_ids = []
    }
}



resource "aws_instance" "tfdemo_server" {
  ami = data.aws_ami.tfdemo_server_ami.id
  key_name = "PeterEc2_key"
  vpc_security_group_ids = [aws_security_group.tfdemo_sg.id]
  instance_type = var.instance_type
  subnet_id =  var.subnet_id

  associate_public_ip_address = true
  tags = {
    Name = "${local.prefix}-server"
  }
  user_data = file("./script.sh")
}
