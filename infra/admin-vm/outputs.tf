output "admin_vm_public_ip" {
  description = "Публичный IP админ-ВМ"
  value       = yandex_compute_instance.admin.network_interface[0].nat_ip_address
}

output "admin_vm_private_ip" {
  description = "Внутренний IP админ-ВМ"
  value       = yandex_compute_instance.admin.network_interface[0].ip_address
}

