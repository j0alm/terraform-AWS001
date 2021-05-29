variable "instance_name" {
  type = string
  default = "Srv-Apache"
}

variable "key_name" {
  default = "GRSI-EMAIL-TESTE"
}

variable "sec_group_name" {
  default = "newSec"
}

variable "cloud_config" {
  type = string
  default = "cloud-config.sh"
}

variable "fw_rules" {
  description = "Firewall rules"
  type = list(tuple([string, number, number, string]))
  default = [
    ["tcp", 22, 22, "Allow SSH"],
    ["tcp", 80, 80, "Allow HTTP"],
    ["tcp", 8080, 8080, "Allow HTTP"],
  ]
}

variable "volume_size" {
  default = 30
}

variable "ip_list" {
  description = "Allowed IPs"
  type = list(string)
  default = [
    "82.154.197.100/32",
  ]
}
