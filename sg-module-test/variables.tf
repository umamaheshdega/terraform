variable "project_name" {
  default = "vertex"
}

variable "environment" {
  default = "test"

}

variable "common_tags" {
  default = {
    project_name = "vertex"
    environment  = "test"
    terraform    = "true"

  }

}

variable "sg_name" {
  default = "mysql"
}

variable "sg_description" {
    default = "Created for MySQL instances in veretx project"
 
}



