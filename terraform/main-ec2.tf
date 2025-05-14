resource "aws_spot_instance_request" "terraform" {
    count = 3
    ami = var.ami_id
    spot_price = var.spot_price
    instance_type = var.instance_type
    root_block_device {
    size = 50
    volume_type = "gp2" # General Purpose SSD
  }
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
        tags = var.tags
}

resource "aws_security_group" "allow_ssh_terraform" {
    name        = var.sg_name
    description = var.sg_description

    # usually we allow everything in egress
    # block
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.ingress_cidr #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.tags
}