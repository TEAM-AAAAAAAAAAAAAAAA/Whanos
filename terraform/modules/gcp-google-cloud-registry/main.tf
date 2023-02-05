---

resource "google_container_registry" "whanos_gcr" {
    project = var.project_id
    location = "EU"
}
