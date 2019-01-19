data "aws_vpc" "test-vpc" {
  id = "${module.vpc.vpc_id}"
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.test-vpc.id}"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "1.13.0"

  instance_count = 1

  name                        = "test-instance"
  key_name                    = "test"
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(data.aws_subnet_ids.all.ids, 0)}"
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
  associate_public_ip_address = true

}

#   TODO Run provisioner

#   connection {
#     user        = "ubuntu"
#     host        = "${self.private_ip}"
#     private_key = "${file("${var.key_path}")}"
#   }

#   # Install python2 for Ansible
#   provisioner "remote-exec" {
#     inline = [ "sudo apt-get update && sudo apt-get install -y python-minimal" ]
#   }

#   # Run Ansible playbook
# #   provisioner "local-exec" {
# #     command = <<EOT
# #       sleep 60;ANSIBLE_CONFIG=../../ansible/ansible.cfg \
# #       ansible-playbook ../../ansible/instance.yml \
# #           --limit ${aws_instance.instance.private_ip} || echo NOK
# #     EOT
# #   }