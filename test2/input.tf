/* Variables */
variable "m_server_port" {
    description = "The port the server will use for HTTP requests"
}
variable "m_ec2_instance_count" {
    description = "The count of the EC2 instances to create"
}
variable "m_ec2_instance_type" {
    description = "The EC2 instance type"
}
variable "m_ec2_instance_name" {
    description = "The EC2 instance name"
}
variable "m_cluster_name" {
    description = "The name of the cluster"
}
variable "m_ami_name" {
    description = "ID name of the AMI"
}
