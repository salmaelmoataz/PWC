resource "aws_ecr_repository" "main" {
  name                 = "${var.project_name}-${var.repo_name}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}