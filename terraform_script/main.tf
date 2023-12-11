# Terraform Provider configurations

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile_name

}


# AWS Private ECR Repository configuration

resource "aws_ecr_repository" "private_ecr_repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}

# IAM Policy to manage the access of the Private Repository

data "aws_iam_policy_document" "ecr_repo_policy" {
  statement {
    sid    = "new policy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.account_id
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
    ]
  }
}

resource "aws_ecr_repository_policy" "ecr_policy" {
  repository = aws_ecr_repository.private_ecr_repo.name
  policy     = data.aws_iam_policy_document.ecr_repo_policy.json
}



