terraform {
  backend "s3" {
    bucket = "peterukpabi-tf-test-bucket"
    key    = "peterukpabi-tf-test-bucket/terraform.tfstate"
    region = "us-west-2"
  }
}
