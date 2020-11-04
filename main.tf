
provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "tf-ce-harbor"
  region      = "southamerica-east1"
}


resource "google_container_cluster" "gke-cluster" {
  name               = "gke-cluster"
  network            = "default"
  location           = "southamerica-east1-b"
  initial_node_count = 2
}


resource "google_container_node_pool" "extra-pool" {
  name               = "extra-node-pool"
  location           = "southamerica-east1-b"
  cluster            = google_container_cluster.gke-cluster.name
  initial_node_count = 2
}