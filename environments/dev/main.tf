module "rg" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "cr" {
  depends_on = [module.rg]
  source     = "../../modules/container_registry"
  acrs       = var.acrs
}

module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/kubernetes_cluster"
  aks        = var.aks
}