resource "aws_subnet" "public" {
  count = length(var.PUBLIC_SUBNET_CIDRS)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_SUBNET_CIDRS[count.index]

  tags = {
    Name = "${var.PROJECT}-${var.ENV}-public subnet"
  }
}

resource "aws_subnet" "private" {
  count = length(var.PRIVATE_SUBNET_CIDRS)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PRIVATE_SUBNET_CIDRS[count.index]

  tags = {
    Name = "${var.PROJECT}-${var.ENV}-private subnet"
  }
}