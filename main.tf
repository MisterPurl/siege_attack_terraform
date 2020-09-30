######################################## PROVIDER ########################################

# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-3"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

######################################## END PROVIDER ########################################
######################################## RESEAU ########################################

# Create a VPC
resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.10.0.0/16"
  tags = {
    name = "vpc_terraform"
  }
}

# Create subnet
resource "aws_subnet" "subnet_public_stresstest_terraform" {
  cidr_block = "10.10.1.0/24"
  vpc_id = aws_vpc.vpc_terraform.id
  tags = {
    Name = "subnet_public_stresstest_terraform"
   }
}

# Create gateway
  resource "aws_internet_gateway" "internetgateway_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "internetgateway_terraform"
  }
}

# Create routetable
resource "aws_route_table" "routetable_stresstest_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgateway_terraform.id
  }

  tags = {
    Name = "routetable_stresstest_terraform"
  }
}
#Create association route table
resource "aws_route_table_association" "routetableassociation_public" {
  subnet_id      = aws_subnet.subnet_public_stresstest_terraform.id
  route_table_id = aws_route_table.routetable_stresstest_terraform.id
}

######################################## END RESEAU ########################################
######################################## RSA KEY ########################################

#Create clé RSA 4096
resource "tls_private_key" "key_terraform" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}
resource "aws_key_pair" "aws_tsunamirr_terraform" {
  key_name   = "aws_tsunamirr_terraform"
  public_key = tls_private_key.key_terraform.public_key_openssh
}

######################################## END RSA KEY ########################################
######################################## INSTANCE ########################################

#Create EC2
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance_stresstest_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_1"
  }
}
resource "aws_instance" "instance_stresstest_2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_2"
  }
}
resource "aws_instance" "instance_stresstest_3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_3"
  }
}
resource "aws_instance" "instance_stresstest_4" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_4"
  }
}
resource "aws_instance" "instance_stresstest_5" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_5"
  }
}
resource "aws_instance" "instance_stresstest_6" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_6"
  }
}
resource "aws_instance" "instance_stresstest_7" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_7"
  }
}
resource "aws_instance" "instance_stresstest_8" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_8"
  }
}
resource "aws_instance" "instance_stresstest_9" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_9"
  }
}
resource "aws_instance" "instance_stresstest_10" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_public_stresstest_terraform.id
  key_name   = aws_key_pair.aws_tsunamirr_terraform.id
  associate_public_ip_address = true
  user_data = file("${path.module}/post_install_siege.sh")
  vpc_security_group_ids =  [aws_security_group.allow_ssh_any.id]

  tags = {
    Name = "instance_stresstest_10"
  }
}
######################################## END INSTANCE ########################################
######################################## SECURITY GROUP ########################################

resource "aws_security_group" "allow_ssh_any" {
  name        = "allow_ssh_from_any"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpc_terraform.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_any"
  }
}

######################################## END SECURITY GROUP ########################################