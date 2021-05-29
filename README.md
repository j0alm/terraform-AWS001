# terraform-AWS001
# Script to create an ec2 instance and running the  server Apache to listen in door 80 and 8080

1 - Change the key name to your key in the variables.tf file 

***********************************
variable "key_name" {
  default = "YOUR-KEY"
}
***********************************


2 - Change the security group to allow your public IP in the variable IP_list in variables.tf file

***********************************
variable "ip_list" {
  description = "Allowed IPs"
  type = list(string)
  default = [
    "Your-Public-IP/32",
  ]
}
***********************************

--- To test, you only have to type your public ip on browser testing the door 80 and 8080 --- 
