# terraform/modules/cicd/codebuild_deploy/main.tf

# CodeBuild (Deploy) does not build anything. It only applies the manifest in EKS.
resource "aws_codebuild_project" "this" {
  name         = var.project_name
  service_role = aws_iam_role.this.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type     = "S3"
    location = var.artifact_bucket
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.project_name}"
      stream_name = "deploy"
    }
  }
}
