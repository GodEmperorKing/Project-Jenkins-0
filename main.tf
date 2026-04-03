resource "aws_s3_bucket" "my_project_bucket" {
  bucket_prefix = "samael-jenkins-project-"
  force_destroy = true 

  tags = {
    Environment = "Dev"
    CreatedBy   = "Jenkins-Automation"
  }
}

resource "aws_s3_object" "screenshots" {
  for_each = fileset("${path.module}/", "*.{png,webp,txt,md}")
  
  bucket = aws_s3_bucket.my_project_bucket.id
  key    = each.value
  source = "${path.module}/${each.value}"
 }

# 1. Turn off the "Block Public Access" safety switch
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_project_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 2. Add a Bucket Policy to allow public reads
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.my_project_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_project_bucket.arn}/*"
      },
    ]
  })
}
