resource "aws_key_pair" "thoh_key" {
  key_name = "thoh-key"
  public_key = file("../../.ssh/thoh-key.pub")
}