resource "aws_instance" "this" {
  ami                    = local.ami_id
  vpc_security_group_ids = local.vpc_ids
  #instance_type          = var.instance_type
  instance_type = local.instance_type
  tags = {
    # expense-dev-backend
    Name    = local.name
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
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
    Name = "allow_tls"
  }
}

output "ec2_info" {
  value = aws_instance.this.vpc_security_group_ids
}