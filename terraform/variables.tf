# mandatory, user should supply
variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

# Optional, default value is t3.micro. User can always override
# t3.micro, t3.medium, t3.small
variable "instance_type" {
    default = "t3.micro"
    type        = string
    validation {
        condition     = contains(["t3.micro", "t3.medium", "t3.small"], var.instance_type)
        error_message = "instance_type can only be one of t3.micro, t3.medium, t3.small"
    } 
}

# mandatory, user should supply
variable "security_group_ids" {
    type = list(string)
}

variable "spot_price" {
    default = "0.03"
}

variable "sg_name" {
    default =  "allow_ssh"
}

variable "from_port" {
    default = "22"
    type = number
}

variable "to_port" {
    default = 22
    type = number
}

variable "protocol" {
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "tags" {
    type = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}