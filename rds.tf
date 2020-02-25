resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "mydb"
  username               = "root"
  password               = "${var.RDS_PASSWORD}"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = "${aws_db_subnet_group.mysql-subnet.name}"
  multi_az               = "false"
  vpc_security_group_ids = ["${aws_security_group.allow-mysql.id}"]
  availability_zone = "${aws_subnet.prod-subnet-private-1.availability_zone}"
  tags = {
    Name = "mysql-instance"
  }
}

