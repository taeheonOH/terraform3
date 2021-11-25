resource "aws_route_table" "thoh_rt" {
    vpc_id = aws_vpc.thoh_vpc.id

    route{
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.thoh_ig.id
    }
    tags = {
      "Name" = "thoh-rt"
    }
}