##############################
# Admin VM in existing VPC   #
##############################

# Lookup existing network and subnet
data "yandex_vpc_network" "net" {
  name = var.network_name
}

data "yandex_vpc_subnet" "subnet" {
  name       = var.subnet_name
  network_id = data.yandex_vpc_network.net.id
}

# Base image for admin VM
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "admin" {
  name        = var.admin_vm_name
  platform_id = "standard-v3"

  resources {
    cores  = var.admin_vm_cores
    memory = var.admin_vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.admin_vm_disk
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys  = "ubuntu:${var.admin_ssh_public_key}"
    user-data = <<-CLOUDCFG
      #cloud-config
      package_update: true
      packages:
        - curl
        - jq
        - apt-transport-https
        - ca-certificates
        - gnupg
      runcmd:
        - sudo -u ubuntu -H bash -lc "curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash"
        - bash -lc 'ln -sf /home/ubuntu/yandex-cloud/bin/yc /usr/local/bin/yc || true'
        - bash -lc 'install -m 0755 -d /etc/apt/keyrings'
        - bash -lc 'curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg'
        - bash -lc 'chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg'
        - bash -lc 'echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" > /etc/apt/sources.list.d/kubernetes.list'
        - bash -lc 'apt-get update && apt-get install -y kubectl && apt-get clean'
    CLOUDCFG
  }
}

