terraform {
  source = "/cicd/../terraform"
}

inputs = {
  region      = "eu-west-2"
  bucket_name = "my-terragrunt-test-bucket"
  environment = "dev"
}
