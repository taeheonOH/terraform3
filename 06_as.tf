resource "aws_ami_from_instance" "thoh_ami" {
  name = "thoh-ami"
  source_instance_id = aws_instance.thoh_web.id
  depends_on = [
    aws_instance.thoh_web  
  ]  
}

resource "aws_launch_configuration" "thoh_lacf" {
  name = "thoh-lacf"
  image_id = aws_ami_from_instance.thoh_ami.id
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  security_groups = [aws_security_group.thoh_sg.id]
  key_name = var.key
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF

}

resource "aws_placement_group" "thoh_pg" {
  name = "thoh-pg"
  strategy = "cluster"  
}

resource "aws_autoscaling_group" "thoh_atsg" {
  name = "thoh-atsg"
  min_size = var.min_size
  max_size = var.max_size
  health_check_grace_period = var.hcgp
  health_check_type = var.hct
  desired_capacity = var.desired_capacity
  force_delete = false
  launch_configuration = aws_launch_configuration.thoh_lacf.name
  #placement_group = aws_placement_group.thoh_pg.id
  vpc_zone_identifier = [aws_subnet.thoh_pub[0].id,aws_subnet.thoh_pub[1].id]   
}

resource "aws_autoscaling_attachment" "thoh_asatt" {
  autoscaling_group_name = aws_autoscaling_group.thoh_atsg.id
  alb_target_group_arn =   aws_lb_target_group.thoh_albtg.arn
}