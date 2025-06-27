output "ec2_infra" {
  value       = length(aws_instance.mahesh)
}

output "ec2_key" {
  value = { for k, inst in aws_instance.mahesh : k => inst.instance_type }
}