resource "google_compute_firewall" "jenkins_app_firewall" {
  name    = "jenkins-firewall"
  network = var.vpc.network_name
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jenkins-server"]
}

resource "google_compute_firewall" "jenkins_ssh_firewall" {
  name    = "jenkins-ssh-firewall"
  network = var.vpc.network_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jenkins-server", "jenkins-server-ssh"]
}

resource "google_compute_address" "jenkins_static_ip" {
  name    = "jenkins-public-ip"
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "jenkins_server" {
  name         = "jenkins-server"
  machine_type = "n1-standard-1"
  zone         = "${var.region}-a"
  tags         = ["jenkins-server", "jenkins-server-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = var.vpc.network_name
    subnetwork = var.vpc.subnet_name
    access_config {
      nat_ip = google_compute_address.jenkins_static_ip.address
    }
  }
}