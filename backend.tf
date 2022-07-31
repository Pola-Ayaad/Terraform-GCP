terraform {
  backend "gcs" {
    bucket      = "bucket-tfstat-123"
    credentials = "pola-gcp-project-1-e0f31973a239.json"
  }
}
