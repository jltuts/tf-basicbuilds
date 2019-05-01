terraform {
  backend "s3" {
    bucket = "jltuts"
    key    = "tfstate"
    region = "us-east-1"
  }
}