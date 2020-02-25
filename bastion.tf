resource "aws_instance" "linux" {
  ami                         = "ami-0df0e7600ad0913a9"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.prod-subnet-public-1.id}"
  vpc_security_group_ids     = ["${aws_security_group.bastion-sg.id}"]
  associate_public_ip_address = true
} 