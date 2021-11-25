resource "aws_route_table_association" "thoh_igas_puba"{
  subnet_id = aws_subnet.thoh_puba.id
  route_table_id = aws_route_table.thoh_rt.id  
}

resource "aws_route_table_association" "thoh_igas_pubc"{
  subnet_id = aws_subnet.thoh_pubc.id
  route_table_id = aws_route_table.thoh_rt.id  
}