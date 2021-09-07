resource "aws_vpc" "vpc" {
  cidr_block                       = "192.168.0.0/20"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-vpc"
    Project = var.project-name
    Env     = var.environment-name
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  # availability_zone = ""
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-public-subnet-1"
    Project = var.project-name
    Env     = var.environment-name
    Type    = "public"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = true
  # availability_zone = ""
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-public-subnet-2"
    Project = var.project-name
    Env     = var.environment-name
    Type    = "public"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.3.0/24"
  map_public_ip_on_launch = false
  # availability_zone = ""
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-private-subnet-3"
    Project = var.project-name
    Env     = var.environment-name
    Type    = "private"
  }
}

resource "aws_subnet" "private-subnet-4" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.168.4.0/24"
  map_public_ip_on_launch = false
  # availability_zone = ""
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-private-subnet-4"
    Project = var.project-name
    Env     = var.environment-name
    Type    = "private"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-public-rt"
    Project = var.project-name
    Env     = var.environment-name
    Type    = "public"
  }
}

resource "aws_route_table_association" "public_rt_1" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "public_rt_2" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-subnet-2.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-private-rt"
    Project = var.project-name
    Env     = var.environment-name
    Type    = "private"
  }
}

resource "aws_route_table_association" "private-rt-3" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id      = aws_subnet.private-subnet-3.id
}

resource "aws_route_table_association" "public_rt_4" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.private-subnet-4.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-igw"
    Project = var.project-name
    Env     = var.environment-name
  }
}

resource "aws_route" "public_rt_igw_r" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
