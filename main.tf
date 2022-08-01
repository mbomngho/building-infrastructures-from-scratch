

data "aws_key_pair" "kojitechskey" {
  key_name           = "kojitechs-key"
}

# Create a VPC
resource "aws_vpc" "Kojitechsvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_tag
  }
}


resource "aws_subnet" "private_sub1" {
  vpc_id     = local.vpc_id
  cidr_block = var.privsub1_cidr
  availability_zone = local.az_priv

  tags = {
    Name = "private_sub"
  }
}

resource "aws_subnet" "private_sub2" {
  vpc_id     = local.vpc_id
  cidr_block = var.privsub2_cidr
  availability_zone = local.az_priv

  tags = {
    Name = "private_sub"
  }
}

resource "aws_subnet" "public_sub1" {
  vpc_id     = local.vpc_id
  cidr_block = var.pubsub1_cidr
  availability_zone = local.az_pub
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public_sub"
  }
}


resource "aws_subnet" "public_sub2" {
  vpc_id     = local.vpc_id
  cidr_block = var.pubsub2_cidr
  availability_zone = local.az_pub
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public_sub"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-0cff7528ff583bf9a"  # use data source
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_sub1.id
  key_name = data.aws_key_pair.kojitechskey.key_name
  tags = {
    Name = "HelloWorld"
  }
}

# check fire wall(security group[22])
# keypair 
# ckeck vpc 
# store[]