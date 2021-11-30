resource "aws_security_group" "thoh_sg" {
  name = "thoh-sg"
  description = "HTTP_ICMP_SQL"
  vpc_id = aws_vpc.thoh_vpc.id

  ingress = [
    {
     description = var.ssh
     from_port = var.port_ssh
     to_port = var.port_ssh
     protocol = var.pro_tcp
     cidr_blocks = [var.cidr_route]
     ipv6_cidr_blocks = [var.cidr_routev6]
     prefix_list_ids = var.nul
     security_groups = var.nul
     self = var.nul
    },
    {
     description = var.http
     from_port = var.port_http
     to_port = var.port_http
     protocol = var.pro_tcp
     cidr_blocks = [var.cidr_route]
     ipv6_cidr_blocks = [var.cidr_routev6]
     prefix_list_ids = var.nul
     security_groups = var.nul
     self = var.nul
    },
    {
     description = var.icmp
     from_port = var.minus
     to_port = var.minus
     protocol = var.pro_icmp
     cidr_blocks = [var.cidr_route]
     ipv6_cidr_blocks = [var.cidr_routev6]
     prefix_list_ids = var.nul
     security_groups = var.nul
     self = var.nul
    },
    {
     description = var.mysql
     from_port = var.port_mysql
     to_port = var.port_mysql
     protocol = var.pro_tcp
     cidr_blocks = [var.cidr_route]
     ipv6_cidr_blocks = [var.cidr_routev6]
     prefix_list_ids = var.nul
     security_groups = var.nul
     self = var.nul
    },  
  ]

  egress = [
   {
       description = var.port_all
       from_port = var.port_zero
       to_port = var.port_zero
       protocol = var.pro_minus
       cidr_blocks = [var.cidr_route]
       ipv6_cidr_blocks = [var.cidr_routev6]
       prefix_list_ids = var.nul
       security_groups = var.nul
       self = var.nul
   }
  ]
  tags = {
      "Name" = "${var.name}-sg"
  }   
}

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "thoh_web" {
 ami = data.aws_ami.amzn.id
 instance_type = var.instance_type
 key_name = var.key
 vpc_security_group_ids = [aws_security_group.thoh_sg.id]
 availability_zone = "${var.region}${var.ava_zone[0]}"
 private_ip = var.pri
 subnet_id = aws_subnet.thoh_pub[0].id
 user_data = file("./wordpress install.sh")

 tags = {
     "Name" = "${var.name}-web"
 }
}

resource "aws_eip" "thoh_web_ip" {
  vpc = true
  instance = aws_instance.thoh_web.id
  associate_with_private_ip = var.pri
  depends_on = [aws_internet_gateway.thoh_ig]  
}

output "public_ip" {
  value = aws_instance.thoh_web.public_ip
}