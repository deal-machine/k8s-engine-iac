variable "project_id" {}
variable "zone" {}
variable "region" {}

variable "cluster_name" {
  default = "main"
}

variable "machine_type" {
  default = "e2-small"
}
variable "image_type" {
  default = "cos_containerd"
}
variable "disk_size_gb" {
  default = 60
}
variable "disk_type" {
  default = "pd-balanced"
}

