variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "name"{
  type = string
  default = "thoh"  
}

variable "key" {
  type = string
  default = "thoh-key"  
}

variable "ava_zone" {
  type = list
  default = ["a","c"]
}

variable "cidr_main" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_sub" {
  type = list
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "pri_sub" {
  default = ["10.0.2.0/24","10.0.3.0/24"]  
}

variable "pri_subdb" {
  default = ["10.0.4.0/24","10.0.5.0/24"]  
}

variable "cidr_route" {
  type = string
  default = "0.0.0.0/0"
}

variable "cidr_routev6" {
  type = string
  default = "::/0"  
}

variable "ssh" {
  type = string
  default = "ssh"  
}

variable "http" {
  type = string
  default = "http"  
}

variable "icmp" {
  type = string
  default = "icmp"  
}

variable "mysql" {
  type = string
  default = "mysql"  
}

variable "port_all" {
  type = string
  default = "all"   
}

variable "port_ssh" {
  type = number
  default = 22  
}

variable "port_http" {
  type = number
  default = 80  
}

variable "port_mysql" {
  type = number
  default = 3306  
}

variable "port_zero" {
  type = number
  default = 0  
}

variable "minus" {
  default = -1  
}

variable "pro_tcp" {
  type = string
  default = "tcp"  
}

variable "pro_icmp" {
  type = string
  default = "icmp"  
}

variable "pro_udp" {
  type = string
  default = "udp"  
}

variable "pro_minus" {
  default = -1  
}

variable "pro_HTTP" {
  type = string
  default = "HTTP"
}

variable "nul" {
  default = null  
}

variable "pri" {
  default = "10.0.0.11" 
}

variable "instance_type" {
  default = "t2.micro"  
}

variable "load_balancer_type" {
  default = "application"  
}

variable "instance_class" {
  default = "db.t2.micro"  
}

variable "healthy_threshold" {
  default = 3  
}

variable "interval" {
  default = 5  
}

variable "matcher" {
  default = "200"  
}

variable "health_path" {
  default = "/health.html" 
}

variable "health_port" {
    default = "traffic-port"
}

variable "timeout" {
  default = 2  
}

variable "unhealthy_threshold" {
  default =  2 
}

variable "type" {
  default = "forward"  
}

variable "iam_instance_profile" {
  default = "admin_role"  
}

variable "min_size" {
  default = 2  
}

variable "max_size" {
  default = 10  
}

variable "hcgp" {
  default = 60  
}

variable "hct" {
  default = "EC2"  
}

variable "desired_capacity" {
  default = 2   
}

variable "allocated_storage" {
  default = 20 
}

variable "storage_type" {
  default =  "gp2"
}

variable "engine_version" {
  default = "8.0"
}

variable "db_name" {
  default = "mydb"
}

variable "username" {
  default = "admin"
}

variable "password" {
  default = "1q2w3e4r"  
}

variable "parameter_group_name" {
  default = "default.mysql8.0"  
}