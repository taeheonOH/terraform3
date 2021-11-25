resource "aws_route_table" "thoh_ngwrt" {
  vpc_id = aws_vpc.thoh_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.thoh_ngw.id  
  }
  tags = {
    "Name" = "thoh-ngwrt"
  }
}