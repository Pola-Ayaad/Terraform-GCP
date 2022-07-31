resource "google_iap_tunnel_instance_iam_member" "instance" {
  instance = "vm"
  project = var.project
  zone = var.zone
  member   = "serviceAccount:${google_service_account.private-vm-service-account.email}"
  role     = "roles/iap.tunnelResourceAccessor"
  depends_on = [google_compute_instance.default]
}