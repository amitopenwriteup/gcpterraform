resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.self_link
  region        = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
    access_config {
      // Ephemeral IP
    }
  }
}

