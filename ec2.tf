<<<<<<< HEAD
resource "aws_instance" "expense" {
  # count = length(var.instances)
  count = 3
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  associate_public_ip_address= true
  tags = {
    Name    = var.instances[count.index]
  }
  # tags = merge(
  #   var.common_tags,
  #   {
  #       Name = var.instances[count.index]
  #   }
  # )
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
=======
resource "aws_instance" "this" {
  for_each = var.instances
ami  = "ami-09c813fb71547fc4f"
vpc_security_group_ids = [aws_security_group.allow_tls.id]
instance_type = each.value
tags = {
  name = each.key
  purpose = "terraform_pratice"
 }
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "allow tls inbound and output traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
   name = "allow_tls"
 }
}

output "ec2_info" {
  value = { for name, inst in aws_instance.this:
  name => {
      id         = inst.id
      public_ip  = inst.public_ip
      private_ip = inst.private_ip
    }
  }
}
>>>>>>> e2741ca (for_each)
