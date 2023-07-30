resource "aws_iam_role" "capstone" {
  name = "eks-cluster-capstone"

  assume_role_policy = <<POLICY
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
POLICY
}

resource "aws_iam_role_policy_attachment" "capstone-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.capstone.name
}

resource "aws_eks_cluster" "capstone" {
  name     = "capstone"
  role_arn = aws_iam_role.capstone.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.capstone-private-1a.id,
      aws_subnet.capstone-private-1b.id,
      aws_subnet.capstone-public-1a.id,
      aws_subnet.capstone-public-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.capstone-AmazonEKSClusterPolicy]
}