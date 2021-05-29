output "instance_id" {
  description = " id of created instances. "
  value = aws_instance.Srv-Apache.id
}

output "private_ip" {
  description = "Private IPs of created instances. "
  value = aws_instance.Srv-Apache.private_ip
}

output "public_ip" {
  description = "Public IPs of created instances. "
  value = aws_instance.Srv-Apache.public_ip
}

output "init_script" {
  description = "Script to be executed upon booting. "
  value = data.template_cloudinit_config.config.rendered
}
