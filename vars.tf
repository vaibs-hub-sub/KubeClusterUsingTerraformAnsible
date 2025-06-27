variable "region" {
  description = "The AWS region to launch instances in"
  type        = string
  default     = "us-east-1"  # Modify this with your preferred AWS region
}

variable "key_name" {
  description = "The SSH key pair name to access the EC2 instances"
  type        = string
  default     = "raman-virginia-key"  # Modify this with your SSH key pair
}

