variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "zone" {
  description = "Зона размещения"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_token" {
  description = "Yandex Cloud OAuth / IAM токен"
  type        = string
  sensitive   = true
}

variable "network_name" {
  description = "Имя существующей VPC сети"
  type        = string
}

variable "subnet_name" {
  description = "Имя существующего сабнета"
  type        = string
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
}

