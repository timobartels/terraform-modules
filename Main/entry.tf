terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {}
}

provider "aws" {
    region = "${var.env_region}"
}

module "test2" {
    source = "git::git@github.com:timobartels/terraform-modules.git//test2"

    cluster_name = "test-Main-cluster"
    ec2_instance_count = 1
    ec2_instance_name = "test-instance"
    ec2_instance_type = "t2.micro"
    server_port = "8080"
    ami_name = "ami-2d39803a"
}
