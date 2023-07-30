terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

data "aws_eks_cluster" "voting-app" {
  name = "voting-app"
}
data "aws_eks_cluster_auth" "voting-app_auth" {
  name = "voting-app_auth"
}

provider "kubernetes" {
   host                   = data.aws_eks_cluster.voting-app.endpoint
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.voting-app.certificate_authority[0].data)
   version          = "2.16.1"
   config_path = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "voting-app"]
    command     = "aws"
  }
}

resource "kubernetes_namespace" "kube-namespace" {
  metadata {
    name = "voting-app"
  }
}