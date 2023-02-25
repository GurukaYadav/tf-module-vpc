resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.PROJECT}-${var.ENV}-igw"
  }
}

resource "aws_eip" "public" {}


resource "aws_nat_gateway" "ngw" {
  count = length(aws_subnet.public)
  allocation_id = aws_eip.public.id
  subnet_id     = aws_subnet.public.*.id[0]

  tags = {
    Name = "${var.PROJECT}-${var.ENV}-ngw"
  }
}