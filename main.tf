# 1. Specify the AWS Provider and Region
provider "aws" {
  region = "us-east-1"
}

# 2. Define the EC2 Instance Resource
resource "aws_instance" "my_ec2" {
  ami           = "ami-0b6d9d3d33ba97d99" 
  instance_type = "t3.micro" 
}


