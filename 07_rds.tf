resource "aws_db_instance" "thoh_mydb" {
    allocated_storage = var.allocated_storage
    storage_type = var.storage_type
    engine = var.mysql
    engine_version = var.engine_version
    instance_class = var.instance_class
    name = var.db_name
    identifier = var.db_name
    username = var.username
    password = var.password
    parameter_group_name = var.parameter_group_name
    availability_zone = "${var.region}${var.ava_zone[0]}"
    db_subnet_group_name = aws_db_subnet_group.thoh_dbsg.id
    vpc_security_group_ids = [aws_security_group.thoh_sg.id]
    skip_final_snapshot = true
    tags = {
      "Name" = "${var.name}-db"  
    }
}

resource "aws_db_subnet_group" "thoh_dbsg" {
  name = "thoh-dbsg"
  subnet_ids = [aws_subnet.thoh_pridb[0].id,aws_subnet.thoh_pridb[1].id]
}