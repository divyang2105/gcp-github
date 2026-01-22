provider "google" {
  project = "green-talent-478006-i8"  # Replace with your GCP project ID
  region  = "us-central1"  # Replace with your preferred region
}

resource "google_artifact_registry_repository" "example1" {
  name     = "my-repository-divyang"  # Replace with your desired repository name
  location = "us-central1"    # Replace with your desired location (e.g., us-central1, europe-west1)
  format   = "DOCKER"         # Replace with your desired format (e.g., DOCKER, MAVEN, NPM, etc.)

  # Optional: You can configure additional fields like labels, description, etc.
  description = "A sample Artifact Registry repository"
  labels = {
    environment = "dev"
    team        = "engineering"
  }
}
