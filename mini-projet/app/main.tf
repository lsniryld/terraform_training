provider "aws" {
  region     = "us-east-1"
  access_key = "change_access_key"
  secret_key = "change_secret_key"
}

terraform {
  backend "s3" {
    bucket     = "terraform-backend-niry"
    key        = "niry-prod.tfstate"
    region     = "us-east-1"
    access_key = "change_access_key"
    secret_key = "change_secret_key"
  }
}

module "sg" {
  source = "../modules/sgmodule"
}

module "eip" {
  source = "../modules/eipmodule"
}

module "ec2" {
  source       = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-niry"
  }
  sgname = module.sg.sg_name_output
  zone_name = "us-east-1e"
  eip_output = module.eip.eip_public_ip
}

module "ebs" {
  source      = "../modules/ebsmodule"
  size_volume = 2
  zone_name = module.ec2.ec2_zone
}

#association entre eip et ec2
resource "aws_eip_association" "eip_ec2" {
  instance_id   = module.ec2.ec2_output
  allocation_id = module.eip.eip_allocation_id
}

#association entre ec2 et ebs
resource "aws_volume_attachment" "ebs_ec2" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_output
  instance_id = module.ec2.ec2_output
}
