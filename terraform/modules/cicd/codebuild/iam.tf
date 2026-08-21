# terraform/modules/cicd/codebuild/iam.tf

# Trust policy (who can take over the role)
data "aws_iam_policy_document" "codebuild_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


# Role
resource "aws_iam_role" "this" {
  name               = "${var.project_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role.json
}


# Append the policy to the paper
resource "aws_iam_role_policy" "this" {
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.codebuild_policy.json
}


#1. Log in to the ECR
#2. Build image
#3. Push to the ECR
#4. Generate kubeconfig
#5. Apply manifest
#6. Log logs
data "aws_iam_policy_document" "codebuild_policy" {

  # ECR - (push imagem)
  statement {
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
    ]

    resources = ["*"]
  }

  # EKS - generate kubeconfig
  statement {
    effect = "Allow"

    actions = [
      "eks:DescribeCluster",
    ]

    resources = ["*"]
  }

  # CodeCommit - clone
  statement {
    effect = "Allow"

    actions = [
      "codecommit:GitPull",
    ]

    resources = ["*"]
  }

  # CloudWatch - logs
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }
}