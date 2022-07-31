resource "google_compute_subnetwork" "managed-subnet" {
  name                     = "management-subnet"
  ip_cidr_range            = "10.0.1.0/24"
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true # private VMs in this subnet without external IP can access Google APIs and services by using Private Google Access 
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name                     = "restricted-subnet"
  ip_cidr_range            = "10.0.2.0/24"
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true # private VMs in this subnet without external IP can access Google APIs and services by using Private Google Access 
  secondary_ip_range {
  range_name    = "pods"
  ip_cidr_range = "192.168.1.0/24"
  }
  secondary_ip_range {
  range_name    = "nodes"
  ip_cidr_range = "192.168.2.0/24"
  }
}