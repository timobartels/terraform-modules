# this is a test module only
terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {}
}

provider "aws" {
    region = "${var.env_region}"
}

resource "aws_instance" "example" {
    ami = "${var.ami_name}"
    count = "${var.ec2_instance_count}"
    instance_type = "${var.ec2_instance_type}"
    vpc_security_group_ids = ["${aws_security_group.example-SG.id}"]

    user_data = <<-EOF
        #!/bin/bash
	echo "Hello World" > index.html
        nohup busybox httpd -f -p "${var.server_port}" &
        EOF

    tags {
        Name = "${var.ec2_instance_name}"
    }
}

resource "aws_security_group" "example-SG" {
    name = "${var.cluster_name}-sg"
    ingress {
        from_port = "${var.server_port}"
        to_port = "${var.server_port}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
