variable "key_name" {
  description = "Name of the SSH keypair to use in AWS." }
variable "key_path" {
  description = "Path to the private portion of the SSH key specified." }
variable "access_key" {
  description = "AWS access key" }
variable "secret_key" {
  description = "AWS secret key" }
variable "region" {
  description = "AWS region"
  default = "ap-southeast-2" }
variable "ami" {
  description = "Base AMI to launch the instance with"
  default = {
    ap-southeast-2 = "ami-07a3bd4944eb120a0" } }