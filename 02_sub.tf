#가용영역 a의 public subnet
resource "aws_subnet"  "thoh_puba" {
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    "Name" = "thoh-puba"  
  } 
}

resource "aws_subnet" "thoh_pubc" {
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "thoh-pubc"  
  } 
}

resource "aws_subnet" "thoh_pria" {
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    "Name" = "thoh-pria"  
  } 
}

resource "aws_subnet" "thoh_pric" {
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = "10.0.3.0/24"
  tags = {
    "Name" = "thoh-pric"  
  } 
}

resource "aws_subnet"  "thoh_pridba" {
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = "10.0.4.0/24"
  tags = {
    "Name" = "thoh-pridba"  
  } 
}

resource "aws_subnet"  "thoh_pridbc" {
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = "10.0.5.0/24"
  tags = {
    "Name" = "thoh-pridbc"  
  } 
}

