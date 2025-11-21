module "rg_prod" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "cr_prod" {
  depends_on = [module.rg_prod]
  source     = "../../modules/container_registry"
  acrs       = var.acrs
}

module "aks_prod" {
  depends_on = [module.rg_prod]
  source     = "../../modules/kubernetes_cluster"
  aks        = var.aks
}