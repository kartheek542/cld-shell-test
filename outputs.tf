output "master_instance_public_ip" {
    description = "public IP of the master instance"
    value = aws_instance.my_master_vm.public_ip
}

output "rem_instance_public_ip" {
    description = "public IP of the rem instance"
    value = aws_instance.my_rem_vm.public_ip
}