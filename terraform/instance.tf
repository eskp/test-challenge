resource "aws_instance" "instance" {
  instance_type           = "${var.instance_type}"
  ami                     = "${lookup(var.ami, var.region)}"
  key_name                = "${var.key_name}"

  disable_api_termination = true
  root_block_device {
    volume_size = "16"
  }

  connection {
    user        = "ubuntu"
    host        = "${self.private_ip}"
    private_key = "${file("${var.key_path}")}"
  }

  # Install python2 for Ansible
  provisioner "remote-exec" {
    inline = [ "sudo apt-get update && sudo apt-get install -y python-minimal" ]
  }

  # Run Ansible playbook
#   provisioner "local-exec" {
#     command = <<EOT
#       sleep 60;ANSIBLE_CONFIG=../../ansible/ansible.cfg \
#       ansible-playbook ../../ansible/instance.yml \
#           --limit ${aws_instance.instance.private_ip} || echo NOK
#     EOT
#   }

  tags = {
    Name = "test-instance",
  }
}