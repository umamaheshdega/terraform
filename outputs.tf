output "ec2_infra" {
  value       = length(aws_instance.expense)
}

# output "ec2_key" {
#   value = { for k, inst in aws_instance.expense : k => inst.instance_type }
# }