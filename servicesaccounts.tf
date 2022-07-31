resource "google_service_account" "private-vm-service-account" {
  account_id = "private-vm-service-account"
}


resource "google_project_iam_binding" "private-vm-access" {
  project = var.project
  role    = "roles/container.admin" # admin access kubernertes cluster
  members = [
    "serviceAccount:${google_service_account.private-vm-service-account.email}"
  ]
}



resource "google_service_account" "k8s-service-account" {
  account_id = "k8s-service-account"
}


resource "google_project_iam_binding" "k8s-access" {
  project = var.project
  role    = "roles/storage.admin" # admin access kubernertes cluster
  members = [
    "serviceAccount:${google_service_account.k8s-service-account.email}"
  ]
}


