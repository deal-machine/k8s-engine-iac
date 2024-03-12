module "vpc" {
  source = "./modules/vpc"
  depends_on = [
    google_project_service.cloudresourcemanager,
    google_project_service.compute,
    google_project_service.container,
    google_project_service.servicecontrol
  ]

  network_name = "network-orderly"
  project_id   = var.project_id
  region       = var.region
}

module "cluster" {
  source = "./modules/cluster"

  depends_on = [module.vpc]

  network_link    = module.vpc.network_link
  subnetwork_link = module.vpc.subnetwork_link
  project_id      = var.project_id
  zone            = var.zone
}
