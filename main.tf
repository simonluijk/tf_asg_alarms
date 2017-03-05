resource "aws_cloudwatch_metric_alarm" "disk_utilization" {
  count = "${length(var.percentages)}"
  alarm_name = "DiskUtilization ${var.asg_name} ${var.device_mountpoint} ${element(var.percentages, count.index)}Percent"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = "3"
  metric_name = "DiskSpaceUtilization"
  namespace = "System/Linux"
  dimensions = {
    AutoScalingGroupName = "${var.asg_name}"
    Filesystem = "${var.device_path}"
    MountPath = "${var.device_mountpoint}"
  }
  period = "300"
  statistic = "Maximum"
  threshold = "${element(var.percentages, count.index)}"
  alarm_description = "Alarm at greater then ${element(var.percentages, count.index)}% disk utilization"
  alarm_actions = ["${var.actions}"]
}
