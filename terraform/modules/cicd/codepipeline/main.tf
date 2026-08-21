# terraform/modules/cicd/codepipeline/main.tf

resource "aws_codepipeline" "this" {
  name     = var.pipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    type     = "S3"
    location = var.artifact_bucket
  }

  # Take the ZIP of CodeCommit and save it in the S3 bucket.
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"

      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName = var.codecommit_repository_name
        BranchName     = var.codecommit_branch
      }
    }
  }

  # Stage Build consumes the artifact source_output and disables CodeBuild to generate a Docker image.
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"

      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  # Stage Deploy is just another CodeBuild. It consumes build_output and runs kubectl apply
  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"

      input_artifacts = ["build_output"]

      configuration = {
        ProjectName = var.codebuild_deploy_project_name
      }
    }
  }
}