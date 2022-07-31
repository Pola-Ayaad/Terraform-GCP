resource "google_container_cluster" "primary" {
    name     = "my-gke-cluster"
    location = var.zone
    #the vpc where the cluster will be
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.restricted-subnet.name
    #to create my node pool manually
    remove_default_node_pool = true
    initial_node_count       = 1 
    # to allocate the secondry IPs provided by my subnet to the pods and services
    ip_allocation_policy {
        cluster_secondary_range_name = google_compute_subnetwork.restricted-subnet.secondary_ip_range.0.range_name
        services_secondary_range_name = google_compute_subnetwork.restricted-subnet.secondary_ip_range.1.range_name
    }
    #to disable any access to my cluster from outside my vpc 
    private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.0/28"
    }

    master_authorized_networks_config {
    cidr_blocks {
        cidr_block = google_compute_subnetwork.managed-subnet.ip_cidr_range
        display_name = "auth_master"
        }
    }
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.k8s-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}