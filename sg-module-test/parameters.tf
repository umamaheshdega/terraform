resource "aws_ssm_parameter" "sg-module-test" {
    name = "/${var.project_name}/${var.environment}/vpc_id"
      type  = "String"
      value = module.sg-test.sg_id

}

