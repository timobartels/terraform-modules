terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {}
}

provider "aws" {
    region = "${var.env_region}"
}

module "test2" {
    source = "../test2"

    m_cluster_name = "test-Main-cluster"
    m_ec2_instance_count = 1
    m_ec2_instance_name = "test-instance"
    m_ec2_instance_type = "t2.micro"
    m_server_port = "8080"
    m_ami_name = "ami-2d39803a"
}
