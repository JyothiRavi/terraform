#vpc

resource "aws_vpc" "main"{
  cidr_block = "${var.aws_vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  enable_classiclink = "true"
  tags {Name = "main"}
 }

 #subnets
#public subnets
resource "aws_subnet" "pub-subnet"{
     vpc_id = "${aws_vpc.main.id}"
     count = "${length(var.pub_zone)}"
     cidr_block = "${element(var.pub_sub_cidr, count.index)}"
     availability_zone = "${element(var.pub_zone, count.index)}"
     map_public_ip_on_launch = "true"
         tags {Name = "pub-subnet-${count.index + 1}"
		        }
}

#Private subnets
resource "aws_subnet" "pvt-subnet"{
       vpc_id = "${aws_vpc.main.id}"
       count = "${length(var.pvt_zone)}"
       cidr_block = "${element(var.pvt_sub_cidr, count.index)}"
       availability_zone = "${element(var.pvt_zone, count.index)}"
       map_public_ip_on_launch = "false"
       tags {Name = "pvt-subnet-${count.index + 1}"}
}



#internetgateways

resource "aws_internet_gateway" "main-gw"{
      vpc_id = "${aws_vpc.main.id}"
          tags { Name = "main-gateway"}
}

#Route table

resource "aws_route_table" "main-public"{
      vpc_id = "${aws_vpc.main.id}"
          route {
                 cidr_block = "0.0.0.0/0"
                         gateway_id = "${aws_internet_gateway.main-gw.id}"
          }
      tags {Name = "main-pub-route"}
}

#Route Assocation Public

resource "aws_route_table_association" "pub-sub"{
      count = "${length(var.pub_zone)}"
      subnet_id = "${element(aws_subnet.pub-subnet.*.id, count.index)}"
      route_table_id = "${aws_route_table.main-public.id}"

}

