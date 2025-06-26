locals {
  ami_id = data.aws_ami.joindevops.id
  instance_type = "t2.micro"
  vpc_ids= ["sg-00f6affe1a0757b91","sg-0e1598dd3f56ee087"]
  name = "${var.project}-${var.environment}-${var.component}"
}
# locals {
#   instance_types = {
#     "us-east-1" = "t2.micro"
#     "us-west-2" = "m5.large"
#     "eu-west-1" = "t3.small"
#   }
# }

# locals {
#   vpc_ids = [
#     "sg-045745a32f4a195c2",
#     "sg-0f0d4e154c4e32832",
#     "sg-0029b70ebf3582240"
#   ]
# }

