variable "region" {
  type = string
}

variable "profile_name" {
  type = string
}

variable "account_id" {
  type = list(string)
}

variable "ecr_repo_name" {
  type = string
}

variable "image_tag_mutability" {
  type = string
}