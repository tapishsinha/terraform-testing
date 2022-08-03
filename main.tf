provider "google" {
  project     = "hero-pubsub-testingv2"
  region      = "asia-south1"
  credentials = "/home/tapish/Downloads/hero-pubsub-testingv2-451f33fb7f28.json"
}

resource "google_project_service" "pubsub-service" {
  project  = "hero-pubsub-testingv2"
  service  = "pubsub.googleapis.com"
}

resource "google_pubsub_topic" "topic_name" {
  name = var.google_pubsub_topic[count.index]
  count=length(var.google_pubsub_topic)
  project  = "hero-pubsub-testingv2"
  /*labels = {
    env = "${var.env}"
  }*/
  depends_on = [
    google_project_service.pubsub-service
  ]
  message_retention_duration = "86600s"
}

#subscription pull

resource "google_pubsub_subscription" "subscription_name" {
  name  = var.google_pubsub_subscription[count.index].name
  topic = var.google_pubsub_subscription[count.index].topic_name

  count =  length(var.google_pubsub_subscription)
  
  message_retention_duration = var.google_pubsub_subscription[count.index].message_retention_duration
  retain_acked_messages      = var.google_pubsub_subscription[count.index].retain_acked_messages

  ack_deadline_seconds = var.google_pubsub_subscription[count.index].ack_deadline_seconds

  expiration_policy {
    ttl = var.google_pubsub_subscription[count.index].ttl
  }
  retry_policy {
    minimum_backoff = var.google_pubsub_subscription[count.index].minimum_backoff
  }

  enable_message_ordering    = var.google_pubsub_subscription[count.index].enable_message_ordering

  depends_on = [
    google_pubsub_topic.topic_name
  ]
}