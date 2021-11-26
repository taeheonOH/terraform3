resource "aws_lb" "thoh_alb" {
  name = "thoh-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.thoh_sg.id]
  subnets = [aws_subnet.thoh_puba.id,aws_subnet.thoh_pubc.id]
  tags = {
    "Name" = "thoh-alb"
  } 
}