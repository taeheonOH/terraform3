resource "aws_lb_target_group_attachment" "thoh_albtgatt" {
  target_group_arn = aws_lb_target_group.thoh_albtg.arn
  target_id = aws_instance.thoh_web.id
  port = 80  
}