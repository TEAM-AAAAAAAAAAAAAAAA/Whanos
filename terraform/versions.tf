terraform {
    required_version = ">= 0.14"
    required_providers {
        google = {
            source = "hashicorp/google"
            version = ">= 4.27"
        }
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = ">= 1.0"
        }
    }
}