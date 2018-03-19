# This is just a test module
terraform {
  required_version = ">= 0.10.0"
}

resource "aws_instance" "example" {
    ami = "${var.m_ami_name}"
    count = "${var.m_ec2_instance_count}"
    instance_type = "${var.m_ec2_instance_type}"
    vpc_security_group_ids = ["${aws_security_group.example-SG.id}"]

    user_data = <<-EOF
        #!/bin/bash
	echo "Hello World" > index.html
        nohup busybox httpd -f -p "${var.m_server_port}" &
        EOF

    tags {
        Name = "${var.m_ec2_instance_name}"
    }
}

resource "aws_security_group" "example-SG" {
    name = "${var.m_cluster_name}-sg"
    ingress {
        from_port = "${var.m_server_port}"
        to_port = "${var.m_server_port}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
