provider "aws" {
  region = "us-east-1"
  access_key = "AKIA4P6KYPSARB6BUEOK"
  secret_key = "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"
} 

# Create an S3 bucket
resource "aws_s3_bucket" "my_buckets" {
  bucket = "my-first-buckt-250"

  tags = {
    Name = "S3-bucket"
  }
}

#Upload a file to the bucket
resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.my_buckets.id
  key    = "terraform_command.txt"
  source = "D:/Documents/GitHub/Terraform/S3-bucket/terraform_command.txt"

}