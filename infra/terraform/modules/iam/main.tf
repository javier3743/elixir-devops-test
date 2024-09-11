resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name     = "cluster-role"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  for_each = toset(var.cluster_roles_policies)

  policy_arn = each.value
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
  tags = {
    Name     = "nodes-role"
  }
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  for_each = toset(var.nodes_roles_policies)

  policy_arn = each.value
  role       = aws_iam_role.eks_node_role.name
}

