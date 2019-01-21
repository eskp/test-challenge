## Documentation

### Infrastructure on AWS

#### Dependencies

* Download & install Terraform [https://terraform.io/] or install with Homebrew on MacOSX `brew install terraform`

* Create AWS account if haven't already [https://aws.amazon.com/]

#### Setup required authentication

* Create Access and Secret keys for an IAM user [https://console.aws.amazon.com/iam/home?#security_credential]. Record these to put in `~/.aws/credentials` file. See https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html

* Create and download AWS EC2 Key Pair [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html]. Save it under `~/.ssh` for example. Specify the path to the key in `terraform.tfvars` file.

### Running Terraform

1. Update `terraform.tfvars` and `variables.tf` files as needed. The important values being keys info (as mentioned above), region and AMIs. The former file contains secret variables and the latter has the rest.

2. Optional: Tell git to ignore the above changes to prevent committing private info:

    git update-index --assume-unchanged terraform.tfvars

3. Run `terraform init` to download any modules that are used.

4. `terraform plan` command will show what will be done.

5. `terraform apply` command will go ahead and provison VPC, security group and EC2 instance.

6. Repeat the two above steps for any future runs if changes are made to any of *.tf files.