terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
}

resource "aws_key_pair" "key" {
    key_name = "terraform-key"
    public_key = file("test_key.pub")
}

resource "aws_instance" "my_master_vm" {
    ami = data.aws_ami.amzlinux.id
    instance_type = var.instance_type
    key_name = aws_key_pair.key.key_name
    user_data = file("install.sh")
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

    tags = {
        Name = "master_cld_shell_instance" 
    }
}

resource "aws_instance" "my_rem_vm" {
    ami = data.aws_ami.amzlinux.id
    instance_type = var.instance_type
    key_name = aws_key_pair.key.key_name
    user_data = file("install.sh")
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

    tags = {
        Name = "rem_cld_shell_instance" 
    }
}