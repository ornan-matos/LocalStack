resource "aws_s3_bucket" "meu_bucket" {
  bucket        = "meu-bucket-de-teste"
  force_destroy = true
}

output "bucket_name" {
  value = aws_s3_bucket.meu_bucket.bucket
}

