## Documentation

### Infrastructure on AWS

#### Dependencies

* Download & install Terraform [https://terraform.io/] or install with Homebrew `brew install terraform`

* Create AWS account if needed [https://aws.amazon.com/]

* Create Access and Secret keys for an IAM user [https://console.aws.amazon.com/iam/home?#security_credential]. Record these to put in `terraform.tfvars` file. This file is ignored by git.

* Create and download AWS EC2 Key Pair [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html]. Save it in the appropriate location (under ~/.ssh for example). Specify the path to the key in `terraform.tfvars` file.
