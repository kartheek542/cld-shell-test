// output "instance_1_public_ip" {
//     description = "public ip of my instance"
//     value = aws_instance.my_personal_vm[0].public_ip
//   
// }
// output "instance_2_public_ip" {
//     description = "public ip of my instance"
//     value = aws_instance.my_personal_vm[1].public_ip
//   
// }
// output "instance_3_public_ip" {
//     description = "public ip of my instance"
//     value = aws_instance.my_personal_vm[2].public_ip
//   
// }

output "instance_public_ip" {
    description = "public IP of the instance"
    value = aws_instance.my_personal_vm.public_ip
}