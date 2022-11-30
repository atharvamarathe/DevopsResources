terraform {
    required_providers {
      aws  = {
        source = "hashicorp/aws"
        version = "4.37.0"
      }
    }
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}

resource "aws_db_instance" "test_rds2" {
    allocated_storage    = 10
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    db_name              = "test_db2"
    username             = "root"
    password             = "root1234"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot  = true
}