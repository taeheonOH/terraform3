resource "aws_autoscaling_attachment" "thoh_asatt" {
  autoscaling_group_name = aws_autoscaling_group.thoh_atsg.id
  alb_target_group_arn =   aws_lb_target_group.thoh_albtg.arn
}
