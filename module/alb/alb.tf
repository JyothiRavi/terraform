resource "aws_alb" "test" {
  name               = "${var.lb_name}"
  internal           = "${var.lb_internal}"
  load_balancer_type = "${var.lb_type}"
  security_groups    = ["${aws_security_group.alb_sg.id}"]
  subnets            = ["${split(",", join(",", var.lb_ec2_subnets))}"]
  tags {
    Environment = "prod"
  }
}

resource "aws_alb_target_group" "test"{
  name = "web-alb-target-group"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.alb_vpc}"
}


resource "aws_alb_target_group_attachment" "test" {
  target_group_arn = "${aws_alb_target_group.test.arn}"
  target_id        = "${var.lb_ec2_instances}"
  port             = 80
}



resource "aws_alb_listener" "test"{
  load_balancer_arn = "${aws_alb.test.arn}"
  port              = "80"
  protocol          = "HTTP"

   default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.test.arn}"
  }
}

resource "aws_security_group" "alb_sg"{
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${var.alb_vpc}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

