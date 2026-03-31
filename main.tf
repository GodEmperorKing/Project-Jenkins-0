resource "aws_s3_bucket" "my_project_bucket" {
  bucket_prefix = "samael-jenkins-project-"
  force_destroy = true 

  tags = {
    Environment = "Dev"
    CreatedBy   = "Jenkins-Automation"
  }
}
