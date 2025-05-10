output "cluster_name" {
  value = google_container_cluster.angga_suriana_gke_cluster.name
}

output "cluster_endpoint" {
  value = google_container_cluster.angga_suriana_gke_cluster.endpoint
}