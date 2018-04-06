resource "aws_cloudtrail" "cloudtrail" {
  name                          = "cloudtrail"
  s3_bucket_name                = "${var.s3_bucket_name}"
  tags                          = "${var.tags}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"
  include_global_service_events = "${var.include_global_service_events}"
}

resource "aws_s3_bucket" "cloudtrail" {
  bucket        = "${var.s3_bucket_name}"
  force_destroy = "${var.force_destroy}"
  region        = "${var.region}"

  lifecycle_rule {
    id      = "cloudtrail"
    enabled = "true"

    transition {
      days          = "${var.glacier_transition_days}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.expiration_days}"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY

  tags = "${var.tags}"
}
