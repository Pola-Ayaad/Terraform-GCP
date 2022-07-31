resource "google_compute_firewall" "allow-ssh" {
  name          = "allow-ssh"
  project       = var.project
  network       = google_compute_network.vpc_network.id
  direction     = "INGRESS"
  priority      = "1000"
  source_ranges = ["35.235.240.0/20"] # ssh using port 22 from IAP trusted      
  target_tags   = ["allow-ssh"] # will only allow VMs with this tag to ssh
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}