resource "aws_spot_instance_request" "terraform" {
    count = 3
    ami = var.ami_id
    spot_price = var.spot_price
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_ids
}