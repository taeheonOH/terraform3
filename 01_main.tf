provider "aws" {
    region = var.region
}

resource "aws_key_pair" "thoh_key" {
  key_name = var.key
  public_key = file("../../.ssh/thoh-key.pub")
}

resource "aws_vpc" "thoh_vpc"{
  cidr_block = var.cidr_main
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
      "Name" = "${var.name}-vpc"
  }
}

resource "aws_subnet"  "thoh_pub" {
  count = length(var.pub_sub)      #2  
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = var.pub_sub[count.index] #index 0 -> 10.0.0.0/24
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava_zone[count.index]}"  
  }
}

resource "aws_subnet" "thoh_pri" {
  count = 2  
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = var.pri_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava_zone[count.index]}"  
  } 
}

resource "aws_subnet"  "thoh_pridb" {
  count = 2  
  vpc_id = aws_vpc.thoh_vpc.id
  cidr_block = var.pri_subdb[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pridb${var.ava_zone[count.index]}"  
  } 
}