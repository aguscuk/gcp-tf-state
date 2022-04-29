provider "google" {
  project     = "learning01-348513"
  region      = "us-central-1"
}
resource "google_storage_bucket" "tf-state-learning" {
  name        = "tf-state-learning"
  location    = "US"
  uniform_bucket_level_access = true
  force_destroy = true
}

# terraform {
#  backend "local" {
#    path = "terraform/state/terraform.tfstate"
#  }
# }

terraform {
  backend "gcs" {
    bucket  = "tf-state-learning"
    prefix  = "terraform/state"
  }
}