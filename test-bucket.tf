terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest version if possible
    }

provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-webhook-success-"
  force_destroy = true

  tags = {
    Name = "My Graded Bucket" 
  }
}
// Final Webhook Trigger v10 - Script Synced.
