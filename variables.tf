variable "instances" {
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
}