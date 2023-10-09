provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "demo-server" {
    ami = "ami-036f5574583e16426"
    instance_type = "t2.micro"
    key_name = "dps"
    security_groups = ["demo-sg"]
  
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH-Access"
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 20
    to_port          = 20
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "ssh access"
  }
}