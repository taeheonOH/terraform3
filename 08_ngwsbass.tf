resource "aws_route_table_association" "thoh_ngwass_pria" {
  subnet_id = aws_subnet.thoh_pria.id
  route_table_id = aws_route_table.thoh_ngwrt.id  
}

resource "aws_route_table_association" "thoh_ngwass_pric" {
  subnet_id = aws_subnet.thoh_pric.id
  route_table_id = aws_route_table.thoh_ngwrt.id  
}

resource "aws_route_table_association" "thoh_ngwass_pridba" {
  subnet_id = aws_subnet.thoh_pridba.id
  route_table_id = aws_route_table.thoh_ngwrt.id  
}

resource "aws_route_table_association" "thoh_ngwass_pridbc" {
  subnet_id = aws_subnet.thoh_pridbc.id
  route_table_id = aws_route_table.thoh_ngwrt.id  
}