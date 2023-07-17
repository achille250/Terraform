

provider "aws" {
  region = "us-east-1"
 }

  # Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-first-buckt"  

  tags = {
    Name = "S3-bucket"
  }
}
resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id

  acl = "private"
}

# Create an IAM user
resource "aws_iam_user" "cesar_user" {
  name = "cesar" 
}

# Create an IAM access key and secret for the user
resource "aws_iam_access_key" "cesar_user_key" {
  user = aws_iam_user.cesar_user.name
}

# Attach a policy to the IAM user granting access to the S3 bucket
resource "aws_iam_user_policy_attachment" "cesar_user_policy" {
  user       = aws_iam_user.cesar_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess" 
}

# Output the access key and secret for the user
output "access_key" {
  value = aws_iam_access_key.cesar_user_key.id
  sensitive = true
}

output "secret_key" {
  value = aws_iam_access_key.cesar_user_key.secret
  sensitive = true
}

