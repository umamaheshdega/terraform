data "aws_ssm_parameter" "vpc_id" {
  name = "/devops/${var.environment}/vpc_id"
}