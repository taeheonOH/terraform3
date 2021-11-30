resource "aws_eip" "thoh_ngw_ip" {
  vpc = true 
}

resource "aws_nat_gateway" "thoh_ngw" {
  allocation_id = aws_eip.thoh_ngw_ip.id
  subnet_id = aws_subnet.thoh_pub[0].id
  tags = {
      "Name" = "${var.name}-ngw"
  }
}

resource "aws_route_table" "thoh_ngwrt" {
  vpc_id = aws_vpc.thoh_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.thoh_ngw.id  
  }
  tags = {
    "Name" = "${var.name}-ngwrt"
  }
}

resource "aws_route_table_association" "thoh_ngwass_pri" {
  count = 2  
  subnet_id = aws_subnet.thoh_pri[count.index].id
  route_table_id = aws_route_table.thoh_ngwrt.id  
}

resource "aws_route_table_association" "thoh_ngwass_pridb" {
  count = 2  
  subnet_id = aws_subnet.thoh_pridb[count.index].id
  route_table_id = aws_route_table.thoh_ngwrt.id  
}