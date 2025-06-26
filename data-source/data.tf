data "aws_ami" "joindevops" {
    most_recent      = true
    owners           = ["973714476881"]
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_ec2_instance_types" "test" {
# filter {
#     name   = "auto-recovery-supported"
#     values = ["true"]
#   }

#   filter {
#     name   = "network-info.encryption-in-transit-supported"
#     values = ["true"]
#   }

#   filter {
#     name   = "instance-storage-supported"
#     values = ["true"]
#   }
#   filter {
#     name   = "current-generation"
#     values = ["true"]
#   }
  filter {
    name   = "instance-type"
    values = ["t3.micro"]  # Example: list the instance types you want
  }
}
# provider "aws" {
#   region = "us-east-1" # or your chosen AWS region
# }
output  "ami_id" {
  value       = data.aws_ami.joindevops.id
}

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}
output "aws_instance_types" {
    value = data.aws_instance_types.test.instance_types
}