resource "aws_s3_bucket" "my_project_bucket" {
  bucket_prefix = "samael-jenkins-project-"
  force_destroy = true 

  tags = {
    Environment = "Dev"
    CreatedBy   = "Jenkins-Automation"
  }
}

resource "aws_s3_object" "screenshots" {
  for_each = fileset("${path.module}/", "*.{png,webp,txt}")
  
  bucket = aws_s3_bucket.my_project_bucket.id
  key    = each.value
  source = "${path.module}/${each.value}"
  acl    = "public-read" # This makes them public automatically!
}
