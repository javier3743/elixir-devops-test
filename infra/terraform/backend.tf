terraform {
  backend "s3" {
    bucket = {{ secrets.TF_VAR_backend_bucket }}
    key    = "terraform.tfstate"
    region = {{ secrets.TF_VAR_region }}
    dynamodb_table = {{ secrets.TF_VAR_backend_key_table }}
  }
}