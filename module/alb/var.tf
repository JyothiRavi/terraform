variable "lb_name"{
  default = "test-alb"
}

variable "lb_internal"{
 default = "false"
}

variable "lb_type"{
 default = "application"
}

variable "alb_vpc"{}


variable "lb_ec2_subnets"{
  type = "list"
}

variable "lb_ec2_instances"{
}
