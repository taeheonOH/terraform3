resource "aws_eip" "thoh_ngw_ip" {
  vpc = true 
}

resource "aws_nat_gateway" "thoh_ngw" {
  allocation_id = aws_eip.thoh_ngw_ip.id
  subnet_id = aws_subnet.thoh_puba.id
  tags = {
      "Name" = "thoh-ngw"
  }
}