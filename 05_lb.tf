resource "aws_lb" "thoh_alb" {
  name = "thoh-alb"
  internal = false
  load_balancer_type = var.load_balancer_type
  security_groups = [aws_security_group.thoh_sg.id]
  subnets = [aws_subnet.thoh_pub[0].id,aws_subnet.thoh_pub[1].id]
  tags = {
    "Name" = "${var.name}-alb"
  } 
}

output "dns_name" {
  value = aws_lb.thoh_alb.dns_name
}

resource "aws_lb_target_group" "thoh_albtg" {
  name = "thoh-albtg"
  port = var.port_http
  protocol = var.pro_HTTP
  vpc_id = aws_vpc.thoh_vpc.id

  health_check {
    enabled = true
    healthy_threshold = var.healthy_threshold
    interval = var.interval
    matcher = var.matcher
    path = var.health_path
    port = var.health_port
    protocol = var.pro_HTTP
    timeout = var.timeout
    unhealthy_threshold = var.unhealthy_threshold  
  }
}

resource "aws_lb_listener" "thoh_alblis" {
  load_balancer_arn = aws_lb.thoh_alb.arn
  port = var.port_http
  protocol = var.pro_HTTP

  default_action {
    type = var.type
    target_group_arn = aws_lb_target_group.thoh_albtg.arn
  }
}