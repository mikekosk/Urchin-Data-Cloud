variable "access_key" {}
variable "secret_key" {}
variable "region" {}

variable "specs" { type = "map"}

// provider declaration
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

// fetch an AMI for ubuntu in the selected region
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    values = ["paravirtual"]
  }

  owners = ["099720109477"]
}

// create a default security group
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}

// Build the instance and launch Ansible to configure it
resource "aws_instance" "generic_node" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.specs["type"]}"

  tags {
    Name = "${var.specs["name"]}"
  }

  security_groups = ["${aws_security_group.allow_all.name}"]
  key_name        = "${var.specs["key_name"]}"

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key ~/.ssh/${var.specs["key_name"]}.pem -i '${aws_instance.generic_node.public_ip},' config/main.yml"
  }
}

// output instance public IP
output "public_ip" {
  value = "${aws_instance.generic_node.public_ip}"
}