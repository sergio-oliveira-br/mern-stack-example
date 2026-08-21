# terraform/modules/cicd/codebuild_deploy/iam.tf

# Trust Policy
data "aws_iam_policy_document" "codebuild_deploy_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.project_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_deploy_assume_role.json
}


# Permissions Policy
data "aws_iam_policy_document" "codebuild_deploy_policy" {

  # S3: read the artifact
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = ["*"]
  }

  # EKS: kubectl
  statement {
    effect = "Allow"
    actions = [
      "eks:DescribeCluster",
      "eks:ListClusters",
      "eks:AccessKubernetesApi"
    ]
    resources = ["*"]
  }

  # STS: assume role that has permission in the cluster
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    resources = ["*"]
  }
}


resource "aws_iam_role_policy" "codebuild_deploy_policy" {
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.codebuild_deploy_policy.json
}