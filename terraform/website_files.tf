locals {
  website_files = fileset("${path.module}/../website", "**/*")
}

resource "aws_s3_object" "website_files" {
  for_each = local.website_files

  bucket = aws_s3_bucket.website.id
  key    = each.value
  source = "${path.module}/../website/${each.value}"
  etag   = filemd5("${path.module}/../website/${each.value}")

  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
      png  = "image/png"
      jpg  = "image/jpeg"
      jpeg = "image/jpeg"
      svg  = "image/svg+xml"
    },
    reverse(split(".", each.value))[0],
    "application/octet-stream"
  )
}