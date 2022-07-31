resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = "vpc-network"
  auto_create_subnetworks = false      # so it won't create subnets in each region
  routing_mode            = "REGIONAL" # all network in the same Region
}