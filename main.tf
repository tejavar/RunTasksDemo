terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.19.0"
    }
  }
}

terraform{


        cloud{
        organization="terraform-tryout"

        workspaces{
                name="RunTasksDemo"
        }
}
}


provider "google" {
//  credentials = file("./tmp/credentials2.json")

  project = "hc-327f90383fff489b9447e89f257"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
      ports    = ["22"]
 //     ports = ["80", "8080", "1000-2000"]
  }

 //  source_ranges = ["192.158.28.0/22"]
     source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}

resource "google_storage_bucket" "my-bucket" {
  name          = "my-bucket-999"
  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

}


//resource "google_storage_bucket" "auto-expire" {
//  name          = "auto-expiring-bucket"
//  location      = "US"
//  force_destroy = true

// lifecycle_rule {
//   condition {
//      age = 3
//    }
//    action {
//      type = "Delete"
//    }
//  }
//}



