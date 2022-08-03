variable "google_pubsub_topic" {
  type=list
  default=["topic-1","topic-2","topic-3","topic-4","topic-5","topic-6","topic-7"]
}

variable "google_pubsub_subscription" {
  type=list(object({
    name = string
    topic_name = string
    message_retention_duration = string
    retain_acked_messages      = bool
    ack_deadline_seconds = number
    ttl = string
    minimum_backoff = string
    enable_message_ordering    = bool
  }))
  
  default=[{
    name = "topic-1-sub"
    topic_name = "topic-1"
    message_retention_duration = "1200s"
    retain_acked_messages      = true
    ack_deadline_seconds = 20
    ttl = "300000.5s"
    minimum_backoff = "10s"
    enable_message_ordering    = false
  },{
    name = "topic-1-sub2"
    topic_name = "topic-1"
    message_retention_duration = "1400s"
    retain_acked_messages      = true
    ack_deadline_seconds = 20
    ttl = "300000.5s"
    minimum_backoff = "10s"
    enable_message_ordering    = false
  },{
    name = "topic-3-sub"
    topic_name = "topic-3"
    message_retention_duration = "1200s"
    retain_acked_messages      = true
    ack_deadline_seconds = 20
    ttl = "300000.5s"
    minimum_backoff = "10s"
    enable_message_ordering    = false
  }]
}

variable "google_project_service" {
  default="hero-pubsub-testingv2"
}

variable "region" {
  default="asia-south1"
}