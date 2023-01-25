variable "instancetype" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "sgname" {
  type        = string
  description = "set security group name"
  default     = "niry-sg"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "ec2-niry"
  }
}
