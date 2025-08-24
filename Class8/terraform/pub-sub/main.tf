provider "google" {
  project = "pure-silicon-463515-t5"
  region  = "us-central1"
}

# UI Topic
resource "google_pubsub_topic" "topic" {
  name = "sample-topic"
}

# UI Subscription (pull)
resource "google_pubsub_subscription" "sub" {
  name  = "sample-sub"
  topic = google_pubsub_topic.topic.id
}
