resource "google_compute_firewall" "jenkins_app_firewall" {
    name   = "jenkins-firewall"
    network = var.vpc_name
    allow {
        protocol = "tcp"
        ports = ["80", "443"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["jenkins-server"]
}

resource "google_compute_firewall" "jenkins_ssh_firewall" {
    name   = "jenkins-ssh-firewall"
    network = var.vpc_name
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["jenkins-server", "jenkins-server-ssh"]
}

resource "google_compute_address" "jenkins_static_ip" {
    name = "jenkins-public-ip"
    project = var.project_id
    region = var.region
    depends_on = [
        google_compute_firewall.jenkins_app_firewall
    ]
}

resource "google_compute_instance" "jenkins_server" {
  name         = "jenkins-server"
  machine_type = "f1-micro"
  zone        = "${var.region}-a}"
  tags = ["jenkins-server", "jenkins-server-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = var.vpc_name

    access_config {
      nat_ip = google_compute_address.jenkins_static_ip.address
    }
  }
}

provisioner "remote-exec" {
    connection {
        host = google_compute_address.jenkins_static_ip.address
        type = "ssh"
        user = var.user
        timeout = "1m"
        private_key = file(var.private_key)
    }
    scripts = [
        "scripts/install-docker.sh",
        "scripts/install-jenkins.sh"
    ]
    depends_on = [ google_compute_firewall.jenkins_ssh_firewall, google_compute_firewall.jenkins_app_firewall ]
    service_account {
        email = var.service_account_email
        scopes = ["cloud-platform", "compute-ro"]
    }
    metadata = {
        ssh-keys = "${var.ssh_user}:${file(var.public_key)}"
    }
}