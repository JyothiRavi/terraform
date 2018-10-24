variable "region" {
  default     = "us-east-1"
}

variable "ec2_ami"{
  type = "map"
  default = {
    us-east-1 = "ami-0ac019f4fcb7cb7e6"
    us-west-2 = "ami-0fcd5791ba781e98f"
   }
}
variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_count" {
  default = "1"
}

variable "ec2_vpc"{}

variable "ec2_azs"{}

variable "ec2_pub_sub"{}

variable "ec2_vpc_security_group_ids"{
 type = "list"
}

