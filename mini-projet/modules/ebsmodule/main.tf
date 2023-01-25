resource "aws_ebs_volume" "myebs" { 
  availability_zone = "${var.zone_name}"
  size              = var.size_volume

  tags = {
    Name = "ebs_${var.name_maintainer}"
  }
}
