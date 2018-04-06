
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| expiration_days | Number of days to expire objects | string | - | yes |
| force_destroy | Force destroy non-empty S3 bucket on destroy | string | `false` | no |
| glacier_transition_days | Number of days to transition objects to GLACIER | string | - | yes |
| include_global_service_events | Whether or not to include global service events, not just regional services | string | `true` | no |
| is_multi_region_trail | Enable cloudtrail events from all regions, not just the current one | string | `true` | no |
| region | Region in which to create the S3 bucket | string | - | yes |
| s3_bucket_name | Name of the S3 bucket to create | string | - | yes |
| tags | Tags for resources that support them | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudtrail_arn |  |
| cloudtrail_id |  |

