variable "asg_name" {
  default = ""
}

variable "actions" {
  default = []
}

variable "device_path" {
  default = "/dev/xvda1"
}

variable "device_mountpoint" {
  default = "/"
}

variable "percentages" {
  default = ["70", "90"]
}
