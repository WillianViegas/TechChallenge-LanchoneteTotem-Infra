# Crie um cluster EKS
resource "aws_eks_cluster" "my_cluster_eks" {
  name     = "my-cluster-eks"
  role_arn = aws_iam_role.my_role_eks.arn
  vpc_config {
    subnet_ids = ["${var.subnet01}", "${var.subnet02}"] # Substitua pelos IDs de suas sub-redes
  }
}

# Crie um repositório ECR
resource "aws_ecr_repository" "TotemRepository" {
  name = "totem-repository"
}

# Permissões IAM necessárias
resource "aws_iam_role" "my_role_eks" {
  name               = "my-role-eks"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}