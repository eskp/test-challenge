resource "aws_instance" "test" {
  instance_type           = "${var.instance_type}"
  ami                     = "${data.aws_ami.ubuntu.id}"
  key_name                = "${var.key_name}"
  vpc_security_group_ids  = ["${module.security_group.this_security_group_id}"]
  subnet_id               = "${aws_subnet.default.id}"
  associate_public_ip_address = true
  root_block_device {
    volume_size = "16"
  }

  connection {
    user        = "ubuntu"
    host        = "${self.public_ip}"
    private_key = "${file("${var.key_path}")}"
  }

  # Install dependencies for Ansible
  provisioner "remote-exec" {
    inline = [ "sudo apt update && sudo apt install -y python-minimal python-setuptools python-pip" ]
  }
  # Run Ansible playbook
  provisioner "local-exec" {
    command = <<EOT
      sleep 60;ANSIBLE_CONFIG=../ansible/ansible.cfg \
      ansible-playbook ../ansible/test-instance.yml \
          --limit ${aws_instance.test.public_ip} || echo NOK
    EOT
  }

  tags = {
    Name = "test-instance",
  }
}