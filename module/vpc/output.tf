output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "pub_subnet_id"{
  value = ["${aws_subnet.pub-subnet.*.id}"]
}

output "pvt_subnet_id"{
  value = "${aws_subnet.pvt-subnet.*.id}"
}

output "igw"{
  value = "${aws_internet_gateway.main-gw.id}"
}

