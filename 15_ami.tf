resource "aws_ami_from_instance" "thoh_ami" {
  name = "thoh-ami"
  source_instance_id = aws_instance.thoh_web.id
  depends_on = [
    aws_instance.thoh_web  
  ]  
}