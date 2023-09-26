variable "vpc_cidr_block" {
  default = "10.2.0.0/16"
}

variable "availability_zone" {
  default = "ap-guangzhou-7"
}

resource "tencentcloud_vpc" "main" {
  name       = "my_vpc"
  cidr_block = var.vpc_cidr_block
}

resource "tencentcloud_subnet" "main" { ###
  name              = "my_subnet"
  availability_zone = var.availability_zone
  vpc_id            = tencentcloud_vpc.main.id
  cidr_block        = tencentcloud_vpc.main.cidr_block
}
