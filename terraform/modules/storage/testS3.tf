# Specify the provider
provider "aws" {
  region = "us-east-1" # Change to your desired region
}
# Create an S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "my-unique-s3-bucket-name" # Replace with a unique bucket name
  acl    = "public-read"                  # Access Control List for the bucket
  tags = {
    Name        = "MyExampleBucket"
    Environment = "Dev"
    # Yor Traceability Tags
    yor_trace_id = "1c3ef6a3-dc0b-4d93-8377-0d5bb413e04f"  # Replace with a unique trace ID
    yor_trace    = "true"
  }
}
# Optional: Add versioning to the bucket
resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
# Optional: Add server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
