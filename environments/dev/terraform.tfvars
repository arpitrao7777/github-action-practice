rgs = {
    rg1 = {
        name     = "dev-rg-1"
        location = "East US"
    }
}

aks = {
    aks1 = {
        name = "dev-aks-1"
        location            = "East US"
        resource_group_name = "dev-rg-1" 
        dns_prefix          = "devaks1"
        node_pool_name      = "default"
        node_count          = 3
        vm_size             = "Standard_D2_v2"
    }
}

acrs = {
    acr1 = {
        name = "devacr1"
        rg_name  = "dev-rg-1"
        location = "East US"
    }
}