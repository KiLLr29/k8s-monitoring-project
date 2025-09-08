output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.otus_cluster.id
}

output "node_group_id" {
  value = yandex_kubernetes_node_group.otus_nodes.id
}

