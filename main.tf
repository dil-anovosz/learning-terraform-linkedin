data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_vpc" "an_test_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "an_test_subnet" {
  vpc_id = aws_vpc.an_test_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "HelloWorld"
  }
}

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.app_ami.id
#   instance_type = "t3.nano"

#   tags = {
#     Name = "HelloWorld"
#   }
# }
