terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rodrigolabs"

    workspaces {
      name = "aws-rodrigolabs"
    }
  }
}
