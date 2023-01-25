provider "aws"{
   region = "us-east-1"
   access_key = "change_access_key"
   secret_key = "change_secret_key"
}

resource "aws_instance" "myec2" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.micro"
   key_name = "devops-niry"
   tags = {
    Name = "ec2-niry"
  }
  root_block_device {
    delete_on_termination = true
  }
}
