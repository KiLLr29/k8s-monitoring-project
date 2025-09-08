# VPC
resource "yandex_vpc_network" "otus_net" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "otus_subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.otus_net.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

# Kubernetes Cluster
resource "yandex_kubernetes_cluster" "otus_cluster" {
  name        = "otus-k8s-cluster"
  network_id  = yandex_vpc_network.otus_net.id
  master {
    version    = var.k8s_version
    public_ip  = true
    zonal {
      zone      = var.zone
      subnet_id = yandex_vpc_subnet.otus_subnet.id
    }
  }
  service_account_id      = var.service_account_id
  node_service_account_id = var.node_service_account_id
}

# Node Group
resource "yandex_kubernetes_node_group" "otus_nodes" {
  cluster_id = yandex_kubernetes_cluster.otus_cluster.id
  name       = "otus-node-group"
  version    = var.k8s_version

  scale_policy {
    fixed_scale {
      size = var.node_count
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }

  instance_template {
    platform_id = "standard-v3"
    resources {
      cores  = var.node_cores
      memory = var.node_memory
    }
    boot_disk {
      type = "network-ssd"
      size = 50
    }
    network_interface {
      subnet_ids = [yandex_vpc_subnet.otus_subnet.id]
      nat        = true
    }
  }
}

