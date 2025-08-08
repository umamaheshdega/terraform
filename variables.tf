variable "instances" {
<<<<<<< HEAD
  default= ["mysql","backend","frontend"]
}
 
    

variable "zone_id" {
    default = "Z000063939MD4K8HB2GI8"
}

variable "domain_name" {
    default = "maheshdevops.info"
}

variable "common_tags" {
    type = map
    default = {
        Project = "mahesh"
        Environment = "prod"
    }
=======
  type = map
  default = {
    MySQL = "t2.micro"
    backend = "t2.small"
    frontend = "t2.large"

  }
}

variable "domain_name" {
  default = "maheshdevops.info"
}

variable "zone_id" {
  default = "Z000063939MD4K8HB2GI8"
>>>>>>> e2741ca (for_each)
}