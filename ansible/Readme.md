# Configuration management with Ansible on AWS instances

1. Install Ansible and boto with `pip`

    pip install ansible boto

1. Make sure AWS Security credentials are setup (https://console.aws.amazon.com/iam/home?#security_credential)

This will be used by the dynamic inventory script to authenticate to AWS. This script is called `hosts` and it's configuration file is `ec2.ini`.

Note: test the above is setup correctly by executing the inventory script listing the entire EC2 inventory:

    ./hosts --list

3. Provision infrastructure

    ansible-playbook test-instance.yml