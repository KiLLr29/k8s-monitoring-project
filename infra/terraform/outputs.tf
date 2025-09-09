output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.otus_cluster.id
}

output "node_group_id" {
  value = yandex_kubernetes_node_group.otus_nodes.id
}

output "admin_vm_public_ip" {
  description = "Публичный IP админ-ВМ (если создана)"
  value       = try(yandex_compute_instance.admin[0].network_interface[0].nat_ip_address, null)
}

output "admin_vm_private_ip" {
  description = "Внутренний IP админ-ВМ (если создана)"
  value       = try(yandex_compute_instance.admin[0].network_interface[0].ip_address, null)
}

