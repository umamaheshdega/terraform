variable "vpc_cidr" {

}

variable "common_tags" {
    default = {}

}
variable "vpc_tags" {
    default = {}
    
}

variable "enable_dns_hostnames" {
    default = true
}

variable "project_name" {

}

variable "environment" {

}

variable "public_subnet_cidrs" {
    type = list
    validation {
        condition     = length(var.public_subnet_cidrs) == 2
        error_message = "Please provide 2 valid public subnet CIDR"
    }
}

variable "public_subnet" {
    default={}
}

variable "private_subnet_cidrs" {
    type = list
    validation {
        condition     = length(var.private_subnet_cidrs) == 2
        error_message = "Please provide 2 valid public subnet CIDR"
    }
}

variable "private_subnet" {
    default={}
}

variable "database_subnet_cidrs" {
    type = list
    validation {
        condition     = length(var.database_subnet_cidrs) == 2
        error_message = "Please provide 2 valid public subnet CIDR"
    }
}

variable "database_subnet" {
    default={}
}

variable "nat_gateway_tags" {
    default = {}

}

variable "igw_tags" {
    default = {}
}

variable "private_route_table_tags" {
    default ={}
}

variable "public_route_table_tags" {
    default ={}
}

variable "database_route_table_tags" {
    default = {}
}