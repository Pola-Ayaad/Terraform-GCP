resource "google_compute_instance" "default" {
  name         = "vm"
  machine_type = "e2-standard-2"
  zone         = var.zone

  tags = ["allow-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.managed-subnet.self_link  #self_link refered to the name of the subnet
    network_ip = "10.0.1.2"

  }

  metadata_startup_script = file("install.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.private-vm-service-account.email
    scopes = ["cloud-platform"]
  }
}