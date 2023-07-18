# Create an IAM policy
resource "aws_iam_policy" "s3_bucket_policy" {
  name        = "S3BucketPolicyAccess"
  description = "Allows s3:ListAllMyBuckets access"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "s3:ListAllMyBuckets",
        "Resource": "*"
      }
    ]
  })
}

# Attach the IAM policy to the IAM user
resource "aws_iam_user_policy_attachment" "s3_bucket_policy_attachment" {
  user       = aws_iam_user.cesar_user.name
  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}
