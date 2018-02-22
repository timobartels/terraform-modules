/* Variables */
variable "server_port" {
    description = "The port the server will use for HTTP requests"
}
variable "ec2_instance_count" {
    description = "The count of the EC2 instances to create"
}
variable "ec2_instance_type" {
    description = "The EC2 instance type"
}
variable "ec2_instance_name" {
    description = "The EC2 instance name"
}
variable "cluster_name" {
    description = "The name of the cluster"
}
variable "ami_name" {
    description = "ID name of the AMI"
}
variable "environment_name" {
    description = "Name of the distinct environment"
}
variable "terraform_state_bucket" {
    description = "Name of S3 bucket that keeps the tfstate files"
}
variable "environment_region" {
    description = "AWS region"
}
