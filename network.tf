resource "aws_internet_gateway" "prod-igw" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    tags = {
        Name = "prod-igw"
    }
}

resource "aws_route_table" "prod-public-crt" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    
    route {

        cidr_block = "0.0.0.0/0" 

        gateway_id = "${aws_internet_gateway.prod-igw.id}" 
    }
    
    tags = {
        Name = "prod-public-crt"
    }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1"{
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
    route_table_id = "${aws_route_table.prod-public-crt.id}"
}



resource "aws_db_subnet_group" "mysql-subnet" {
  name        = "mysql-subnet"
  description = "RDS subnet group"
  subnet_ids  = ["${aws_subnet.prod-subnet-private-1.id}", "${aws_subnet.prod-subnet-private-2.id}"]

  tags = {
    Name = "mysql rds subnet group"
  }
}