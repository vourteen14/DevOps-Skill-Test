resource "google_compute_network" "angga_suriana_vpc" {
  name                    = "angga-suriana-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "angga_suriana_subnet" {
  name          = "angga-suriana-subnet"
  network       = google_compute_network.angga_suriana_vpc.id
  region        = var.region
  ip_cidr_range = "10.20.0.0/20"
}

resource "google_container_cluster" "angga_suriana_gke_cluster" {
  name     = "angga-suriana-gke-cluster"
  location = var.zone
  networking_mode = "VPC_NATIVE"

  network    = google_compute_network.angga_suriana_vpc.name
  subnetwork = google_compute_subnetwork.angga_suriana_subnet.name

  deletion_protection       = false
  initial_node_count        = 1
  remove_default_node_pool  = true

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }
}

resource "google_container_node_pool" "angga_suriana_gke_node_pool" {
  name     = "angga-suriana-node-pool"
  cluster  = google_container_cluster.angga_suriana_gke_cluster.id
  location = var.zone

  node_config {
    disk_size_gb = 50
    disk_type    = "pd-ssd"
    machine_type = "e2-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  node_count = 2
}