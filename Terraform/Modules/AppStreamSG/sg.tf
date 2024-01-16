resource "aws_security_group" "aws_sg" {
  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg_name
  } 


}


