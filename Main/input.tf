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
variable "env_region" {
    description = "AWS region to deploy"
}
