resource "aws_instance" "web" {
  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "${var.ec2_instance_type}"
  count = "${var.ec2_count}"
  availability_zone = "${var.ec2_azs}"
  subnet_id = "${var.ec2_pub_sub}"
  vpc_security_group_ids = ["${var.ec2_vpc_security_group_ids}"]
  tags {
    Name = "HelloWorld"
  }
}

output "ec2_instances"{
  value = "${aws_instance.web.*.id}"
}
