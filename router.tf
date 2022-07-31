### Cloud router enables you to exchange routes between vpc and peers 
resource "google_compute_router" "my-router" {
  name    = "my-router"
  region  = var.region
  network = google_compute_network.vpc_network.id
}