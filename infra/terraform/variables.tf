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

