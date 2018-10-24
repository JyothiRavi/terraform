module "my_vpc"{
 source = "../module/vpc"
 azs_region = "us-east-1"
 aws_vpc_cidr = "10.0.0.0/16"
 pub_sub_cidr = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
 pvt_sub_cidr = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
 pub_zone = ["us-east-1a","us-east-1b","us-east-1c"]
 pvt_zone = ["us-east-1d","us-east-1e","us-east-1f"]
}


module "my_ec2"{
 source = "../module/ec2"
 ec2_instance_type = "t2.micro"
 ec2_count = "2"
 ec2_vpc = "${module.my_vpc.vpc_id}"
 ec2_azs = "us-east-1a"
 ec2_pub_sub = "${element(module.my_vpc.pub_subnet_id, 0)}"
 ec2_vpc_security_group_ids = ["${module.my_ec2.ec2_sec}"]
}

module "my_alb"{
 source = "../module/alb"
 lb_name = "test-alb"
 lb_internal = "false"
 lb_type = "application"
 alb_vpc = "${module.my_vpc.vpc_id}"
 lb_ec2_subnets = ["${element(module.my_vpc.pub_subnet_id, 0)},${element(module.my_vpc.pub_subnet_id, 1)}"] 
 lb_ec2_instances = "${module.my_ec2.ec2_instances}"
}

