terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {}
}

provider "aws" {
    region = "${var.env_region}"
}

module "test2" {
    source = "./test2"

    m_cluster_name = "${var.cluster_name}"
    m_ec2_instance_count = "${var.ec2_instance_count}"
    m_ec2_instance_name = "${var.ec2_instance_name}"
    m_ec2_instance_type = "${var.ec2_instance_type}"
    m_server_port = "${var.server_port}"
    m_ami_name = "${var.ami_name}"
}
