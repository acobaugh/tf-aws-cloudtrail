output "cloudtrail_id" {
  value = "${aws_cloudtrail.default.id}"
}

output "cloudtrail_arn" {
  value = "${aws_cloudtrail.default.arn}"
}
