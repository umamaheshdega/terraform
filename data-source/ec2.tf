resource "aws_instance" "this" {
  ami                    = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = lookup(local.instance_types, var.region, "t2.large")
  tags = {
    Name    = "terraform-demo"
    Purpose = "terraform-practice"
  }
}

variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"  # You can change this or override with -var or TF_VAR_region
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