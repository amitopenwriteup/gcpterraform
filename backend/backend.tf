terraform {
  backend "gcs" {
    bucket         = "amitowproject"
    prefix         = "terraform/state"
  }
}
