terraform {
  required_version = ">= 1.5.7" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.0"
    }
  }
  backend "s3" {
    bucket         = "terrform-datavisyn-tfstate" 
    key            = "datavisynn/test/datavisyn-test"   
    region         = "eu-west-1"                   
    encrypt        = true
    use_lockfile   = true
    assume_role = {
      role_arn = "arn:aws:iam::297071026656:role/terraform-role"
    }
  }
}

