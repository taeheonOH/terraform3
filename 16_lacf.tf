resource "aws_launch_configuration" "thoh_lacf" {
  name = "thoh-lacf"
  image_id = aws_ami_from_instance.thoh_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.thoh_sg.id]
  key_name = "thoh-key"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF

}