resource "google_storage_bucket" "terraform_state_bucket" {
  name          = "amitowproject"
  location      = "US"
  force_destroy = true
}

