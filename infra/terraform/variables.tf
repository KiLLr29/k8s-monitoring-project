variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_token" {
  description = "Yandex Cloud OAuth или IAM-токен"
  type        = string
  sensitive   = true
}

variable "service_account_id" {
  description = "ID сервисного аккаунта для управления кластером Kubernetes"
  type        = string
}

variable "node_service_account_id" {
  description = "ID сервисного аккаунта для узлов Kubernetes"
  type        = string
}

variable "network_name" {
  description = "Имя VPC сети"
  type        = string
  default     = "otus-vpc"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "otus-subnet"
}

variable "k8s_version" {
  description = "Версия Kubernetes"
  type        = string
  default     = "1.29"
}

variable "node_count" {
  description = "Количество узлов в кластере"
  type        = number
  default     = 2
}

variable "node_cores" {
  description = "Количество CPU на узел"
  type        = number
  default     = 2
}

variable "node_memory" {
  description = "Память на узел (ГБ)"
  type        = number
  default     = 4
}

# Admin VM (optional)
variable "create_admin_vm" {
  description = "Создавать отдельную админ-ВМ для работы с кластером"
  type        = bool
  default     = false
}

variable "admin_vm_name" {
  description = "Имя админ-ВМ"
  type        = string
  default     = "kube-admin"
}

variable "admin_vm_cores" {
  description = "vCPU админ-ВМ"
  type        = number
  default     = 2
}

variable "admin_vm_memory" {
  description = "Память админ-ВМ (ГБ)"
  type        = number
  default     = 4
}

variable "admin_vm_disk" {
  description = "Размер диска админ-ВМ (ГБ)"
  type        = number
  default     = 20
}

variable "admin_ssh_public_key" {
  description = "Публичный SSH-ключ для пользователя ubuntu (ssh-ed25519/ssh-rsa ...)"
  type        = string
  default     = "AAAAB3NzaC1yc2EAAAADAQABAAABAQDUFxFeTcznPfFb6ACGZLwl1viN4QV3UDeZpwnrR0bLGm0WqJkIOtZfI270UjE5vyX58HV5gY92e1yFY4Ai2Mk+057H1gAFm38vdNAinraPIXJHTM/y5hJiPC/bM88YRbLA1tyGh2QyvWGzePyQstbbXaP0W9LqqYTXnmY2h3iOVWc6Jq+7H+GN+7lWob3WcpKcrTL8b/igijp/3xvBr6Rz82LQje+1bHkagD9EezrQ6fq6kY/q2eCQ+8QBoheGYpwEHhbrJxJTkpa4Z1DQ+R79t0F55vRSLmOpcnlyzJSe4Vr4OYGkw9hAbWbIX5e0ICe+TYWRqTmYhX9+01ATUi/p"
}

