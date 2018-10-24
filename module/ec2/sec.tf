resource "aws_security_group" "instance"{
 name = "instance-sg"
 vpc_id = "${var.ec2_vpc}"
 ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ec2_sec"{
 value = ["${aws_security_group.instance.id}"]
}
