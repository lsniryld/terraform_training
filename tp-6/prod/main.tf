provider "aws" {
  region     = "us-east-1"
  access_key = "change_access_key"
  secret_key = "change_secret_key"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-niry"
    key    = "niry-prod.tfstate"
    region = "us-east-1"
    access_key = "change_access_key"
    secret_key = "change_secret_key"
  }
}

module "ec2" {
   source = "../modules/ec2module"
   instancetype = "t2.micro"
   aws_common_tag = {
     Name = "ec2-prod-niry"
   }
   sgname = "prod-niry-sg"
}
