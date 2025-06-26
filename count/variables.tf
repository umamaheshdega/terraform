variable "instances" {
    default = ["mysql", "backend", "frontend"]
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
        Project = "expense"
        Environment = "dev"
    }
}