terraform {
  backend "s3" {
    bucket = "k8scluster"
    key    = "TF/terraform.tfstate"
    region = "us-east-1"
    endpoint = "https://fra1.digitaloceanspaces.com"
    access_key = "RKUDR2F7QVVFD342ZIEF"
    secret_key = "T3PnBmRhXR4s+vJCcFzo4+B2pzEgJRkljE7dxkpzr2M"
    skip_credentials_validation = true
    skip_metadata_api_check = true
  }
}