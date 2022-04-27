terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.19.0"
    }
  }
}

provider "google" {

  project = "hc-f4902757127142998e96816128a"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}






