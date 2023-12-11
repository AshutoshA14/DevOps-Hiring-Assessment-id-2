# Variables to be used by Provider block

variable "region" {
  description = "AWS region to be used by Provider block"
  type = string
}

variable "profile_name" {
  description = "AWS user profile name "
  type = string
}

 # Variables to be used in ECR Repo  
 
variable "account_id" {
  description = "AWS user sccount id "
  type = list(string)
}

variable "ecr_repo_name" {
  description = "AWS ECR Repository name to be used"
  type = string
}

variable "image_tag_mutability" {
  description = "Image tag mutability value"
  type = string
}