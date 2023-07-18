# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-first-buckt"

  tags = {
    Name = "S3-bucket"
  }
}