output "instance_public_ip" {
    description = "public IP of the instance"
    value = aws_instance.my_personal_vm.public_ip
}