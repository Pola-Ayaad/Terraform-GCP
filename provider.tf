provider "google" {
  credentials = file("pola-gcp-project-1-e0f31973a239.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}