variable "region" {
  default     = "us-east-1"
}

variable "vpc_cidr" {
 default = "10.0.0.0/16"
 }

variable "pub_cidr"{
 type = "list"
 default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
 }

variable "pvt_cidr"{
 type = "list"
 default = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
 }
 
variable "pub_azs"{
 type = "list"
 default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "pvt_azs"{
 type = "list"
 default = ["us-east-1d","us-east-1e","us-east-1f"]
}

variable "azs_region"{}

variable "aws_vpc_cidr"{}

variable "pub_sub_cidr"{
  type = "list"
}

variable "pvt_sub_cidr"{
  type = "list"
}

variable "pub_zone"{
  type = "list"
}

variable "pvt_zone"{
  type = "list"
}
