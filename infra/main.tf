terraform {
  required_version = ">= 1.5.0"

 backend "s3" {
    bucket         = "abufo-tf-remote-state-31482"
    key            = "project3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "abufo-tf-remote-state-31482"

  tags = {
    Name        = "project3-terraform-state"
    Environment = "learning"
    Project     = "aws-portfolio-project-3"
  }
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "project3-terraform-locks"
    Environment = "learning"
    Project     = "aws-portfolio-project-3"
  }
}