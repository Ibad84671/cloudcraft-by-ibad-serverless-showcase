variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "cloudcraft"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Environment = "demo"
    Project     = "cloudcraft"
    ManagedBy   = "Terraform"
  }
}