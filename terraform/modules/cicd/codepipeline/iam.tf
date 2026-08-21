# terraform/modules/cicd/codepipeline/iam.tf

# Trust Policy
resource "aws_iam_role" "codepipeline_role" {
  name = "${var.pipeline_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}


# Permissions Policy
resource "aws_iam_role_policy" "codepipeline_policy" {
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # CodeCommit
      {
        Effect   = "Allow"
        Action   = [
          "codecommit:GetBranch",
          "codecommit:GetCommit"
        ]
        Resource = "*"
      },

      # CodeBuild
      {
        Effect   = "Allow"
        Action   = [
          "codebuild:StartBuild"
        ]
        Resource = "*"
      },

      # S3
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = "*"
      }
    ]
  })
}

