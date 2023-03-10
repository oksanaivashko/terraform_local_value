resource "aws_instance" "app-dev" {
  ami           = "ami-0f1a5f5ada0e7da53"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-0f1a5f5ada0e7da53"
  instance_type = "t2.small"
  tags          = local.common_tags
}


resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags              = local.common_tags
}