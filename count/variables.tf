variable "instances" {
  type = map
    default = {
    MySQL = "t2.micro"
    backend = "t2.small"
    frontend = "t2.large"
  
  }
}

variable "zone_id" {
    default = "Z0763118WV63KYFJD7RF"
}

variable "domain_name" {
    default = "ansible.mahesh.com"
}

variable "common_tags" {
    type = map
    default = {
        Project = "mahesh"
        Environment = "prod"
    }
}