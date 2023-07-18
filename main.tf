# Create an IAM user
resource "aws_iam_user" "cesar_user" {
  name = "cesar"
}
# Create an IAM access key and secret for the user
resource "aws_iam_access_key" "cesar_user_key" {
  user = aws_iam_user.cesar_user.name
}
 # Output the access key and secret for the user
output "access_key" {
  value     = aws_iam_access_key.cesar_user_key.id
  sensitive = true
}

output "secret_key" {
  value     = aws_iam_access_key.cesar_user_key.secret
  sensitive = true

}




