resource "aws_subnet" "public" {
  count = length(var.PUBLIC_SUBNETS_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_SUBNETS_CIDR[count.index]
  availability_zone = var.PUBLIC_SUBNETS_AZ[count.index]

  tags = {
    Name = "${var.PROJECT}-${var.ENV}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  count = length(var.PRIVATE_SUBNETS_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PRIVATE_SUBNETS_CIDR[count.index]
  availability_zone = var.PRIVATE_SUBNETS_AZ[count.index]

  tags = {
    Name = "${var.PROJECT}-${var.ENV}-private-subnet"
  }
}