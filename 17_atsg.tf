resource "aws_placement_group" "thoh_pg" {
  name = "thoh-pg"
  strategy = "cluster"  
}

resource "aws_autoscaling_group" "thoh_atsg" {
  name = "thoh-atsg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 60
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = false
  launch_configuration = aws_launch_configuration.thoh_lacf.name
  #placement_group = aws_placement_group.thoh_pg.id
  vpc_zone_identifier = [aws_subnet.thoh_puba.id,aws_subnet.thoh_pubc.id]   
}
