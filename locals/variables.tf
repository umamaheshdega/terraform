variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "description"
}

variable "project" {
    default = "devops"
}

variable "component" {
    default = "frontend"
}

variable "environment" {
    default = "prod"
}

