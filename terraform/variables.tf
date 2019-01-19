variable "key_name" {
  description = "Name of the SSH keypair to use in AWS." }
variable "key_path" {
  description = "Path to the private portion of the SSH key specified." }
variable "region" {
  description = "AWS region"
  default = "ap-southeast-2" }
variable "instance_type" {
  description = "The size of the instance"
  default = "t2.micro" }
## Network Specification
variable "vpc_cidr" {
  description = "The CIDR Range for the Kubernetes cluster vpc"
  default     = ""
}
variable "az_list" {
  description = "The AZ of the Kubernetes cluster will be placed in"
  default     = []
}
variable "private_subnet_cidr_list" {
  description = "The CIDR list of the Kubernetes nodes will be placed in"
  default     = []
}
variable "public_subnet_cidr_list" {
  description = "The CIDR list of the Kubernetes Public Pieces will be placed in"
  default     = []
}