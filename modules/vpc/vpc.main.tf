# ---------------------------------------------------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "vpc" {
  cidr_block                = "${var.cidr_block}"

  tags = "${merge(map("Name", "vpc-${lower("${var.client_name}-${var.environment_name}")}"), local.resource_tags)}"

}


# Public Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                    = "${aws_vpc.vpc.id}"
  availability_zone         = "${var.az1}"
  cidr_block                = "${var.cidr_block_public_1}"

  tags = "${merge(map("Name", "sbt-${lower("${var.client_name}-${var.environment_name}")}-public-1"), local.resource_tags)}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                    = "${aws_vpc.vpc.id}"
  availability_zone         = "${var.az2}"
  cidr_block                = "${var.cidr_block_public_2}"

  tags = "${merge(map("Name", "sbt-${lower("${var.client_name}-${var.environment_name}")}-public-2"), local.resource_tags)}"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_subnet" "private_subnet_1" {
  vpc_id                    = "${aws_vpc.vpc.id}"
  availability_zone         = "${var.az1}"
  cidr_block                = "${var.cidr_block_private_1}"

  tags = "${merge(map("Name", "sbt-${lower("${var.client_name}-${var.environment_name}")}-private-1"), local.resource_tags)}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                    = "${aws_vpc.vpc.id}"
  availability_zone         = "${var.az2}"
  cidr_block                = "${var.cidr_block_private_2}"

  tags = "${merge(map("Name", "sbt-${lower("${var.client_name}-${var.environment_name}")}-private-2"), local.resource_tags)}"

  lifecycle {
    create_before_destroy = true
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id                    = "${aws_vpc.vpc.id}"

  tags = "${merge(map("Name", "igw-${lower("${var.client_name}-${var.environment_name}")}"), local.resource_tags)}"

}

# Elastic IP
resource "aws_eip" "eip-nat-1" {
  vpc   = true

  tags = "${merge(map("Name", "eip-${lower("${var.client_name}-${var.environment_name}")}-nat-1"), local.resource_tags)}"

}

resource "aws_eip" "eip-nat-2" {
  vpc   = true

  tags = "${merge(map("Name", "eip-${lower("${var.client_name}-${var.environment_name}")}-nat-2"), local.resource_tags)}"

}


# NAT Gateways
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id             = "${aws_eip.eip-nat-1.id}"
  subnet_id                 = "${aws_subnet.public_subnet_1.id}"

  tags = "${merge(map("Name", "nat-${lower("${var.client_name}-${var.environment_name}")}-1"), local.resource_tags)}"

  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id             = "${aws_eip.eip-nat-2.id}"
  subnet_id                 = "${aws_subnet.public_subnet_2.id}"

  tags = "${merge(map("Name", "nat-${lower("${var.client_name}-${var.environment_name}")}-2"), local.resource_tags)}"

  depends_on = ["aws_internet_gateway.igw"]
}


# Public Route Table
resource "aws_route_table" "public" {
  vpc_id                    = "${aws_vpc.vpc.id}"

  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = "${aws_internet_gateway.igw.id}"
  }

  tags = "${merge(map("Name", "rtb-${lower("${var.client_name}-${var.environment_name}")}-public"), local.resource_tags)}"

}

# Private Route Tables
resource "aws_route_table" "private-1" {
  vpc_id                    = "${aws_vpc.vpc.id}"

  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = "${aws_nat_gateway.nat_gateway_1.id}"
  }

  tags = "${merge(map("Name", "rtb-${lower("${var.client_name}-${var.environment_name}")}-private-1"), local.resource_tags)}"

}

resource "aws_route_table" "private-2" {
  vpc_id                    = "${aws_vpc.vpc.id}"

  route {
    cidr_block              = "0.0.0.0/0"
    gateway_id              = "${aws_nat_gateway.nat_gateway_2.id}"
  }

  tags = "${merge(map("Name", "rtb-${lower("${var.client_name}-${var.environment_name}")}-private-2"), local.resource_tags)}"

}

# ---------------------------------------------------------------------------------------------------------------------
# Route Table Association
# ---------------------------------------------------------------------------------------------------------------------

# Public Route Table Association
resource "aws_route_table_association" "public-1" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.public.id}"

  lifecycle {
    create_before_destroy = true
  }
}


# Private Route Table Association
resource "aws_route_table_association" "private-1" {
  subnet_id      = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.private-1.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = "${aws_subnet.private_subnet_2.id}"
  route_table_id = "${aws_route_table.private-2.id}"

  lifecycle {
    create_before_destroy = true
  }
}