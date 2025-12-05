provider "aws" {
  region = "ap-south-1" 
}

resource "aws_instance" "example" {
  ami                    = "ami-03aa99ddf5498ceb9"
  instance_type          = "t3.micro"
  key_name               = "master"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  

  # Remote-exec provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "echo Hello from Terraform remote-exec on Ubuntu! | sudo tee /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/t/bsnttech-terrafrm-exercise/provisioners/master.pem")
      host        = self.public_ip
    }
  }

  # Local-exec provisioner (creation time)
  provisioner "local-exec" {
    command = "echo EC2 instance ${self.id} created in Oregon >> ec2_log.txt"
  }

  # Local-exec provisioner (destroy time)
  provisioner "local-exec" {
    when    = destroy
    command = "echo EC2 instance ${self.id} is being destroyed >> ec2_log.txt"
  }
}

# Security Group to allow SSH and HTTP
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  vpc_id      = "vpc-00af9de1901892703"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
