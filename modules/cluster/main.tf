resource "google_container_cluster" "primary" {
  name                     = "primary"
  location                 = var.zone
  deletion_protection      = false
  initial_node_count       = 1
  network                  = var.network_link
  subnetwork               = var.subnetwork_link
  remove_default_node_pool = true
  project                  = var.project_id
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1
  node_config {
    # preemptible  = true
    machine_type = "e2-small"
    image_type   = "cos_containerd"
    disk_size_gb = 60
    disk_type    = "pd-balanced"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

data "google_client_config" "provider" {}
