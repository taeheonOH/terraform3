resource "aws_internet_gateway" "thoh_ig" {
    vpc_id = aws_vpc.thoh_vpc.id

    tags = {
      "Name" = "thoh-ig"
    }
}