resource "aws_instance" "" {
  ami                    = var.ami_id = "prod"? "ami-09c813fb71547fc4f": "ami-07041441b708acbd6"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.environment = "prod"? "t2.small": "t2.micro"
  tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}