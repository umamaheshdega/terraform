resource "aws_instance" "mahesh" {
 for_each = var.instances
  # count = 3
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          =  each.value
  tags = {
    name = each.key
  }
}
  # tags = merge(
  #   var.common_tags,
  #   {
  #       Name = var.instances[count.index]
  #   }
  # )



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

# output "ec2_key" {
#   value = { for k, inst in aws_instance.mahesh : k => inst.key_name }
# }

# output "ec2_info" {
#   value = aws_instance.mahesh[each.value]
# }