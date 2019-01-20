provider "aws" {
  version                 = "~> 1.15"
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}