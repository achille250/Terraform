provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "ubuntu" {
    ami = "ami-07d0cf3af28718ef8"
    instance_type = "t2.micro"

    tags = {
      Name="HelloTerraform"
    }
  
}