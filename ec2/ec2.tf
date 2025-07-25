resource "aws_instance" "terraform_demo" {
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_sg.id]
  instance_type          = "t3.micro"
  tags = {
    Name    = "terraform_devops"
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_sg" {
  name        = "allow_sg_1"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_sg"
  }
}