variable "aws_region" {
    description = "Region in which AWS resources are provisioned"
    type = string
    default = "us-east-1"
}

variable "instance_type" {
    description = "Type of the instance"
    type = string
    default = "t2.micro"
}