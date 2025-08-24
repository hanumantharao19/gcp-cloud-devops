provider "google" {
  project = "pure-silicon-463515-t5"
  region  = "us-central1"
}



# 📌 Create Secret
resource "google_secret_manager_secret" "secret" {
  secret_id = "sample-api-key"

  replication {
    auto {}
  }

}

# 📌 Add Secret Version (the actual value)
resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = "12345-abcde"
}

