provider "alicloud" {
  region = "cn-hangzhou"
  version = "=1.118.0"
}

resource "alicloud_quotas_quota_application" "example" {
  notice_type        = "0"
  desire_value       = "100"
  product_code       = "ess"
  quota_action_code  = "q_db_instance"
  reason             = "For Terraform Test"
  dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }
}

resource "alicloud_quotas_quota_alarm" "example" {
  quota_alarm_name  = "tf-testAcc"
  product_code      = "ecs"
  quota_action_code = "q_prepaid-instance-count-per-once-purchase"
  threshold         = "100"
  quota_dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }
}