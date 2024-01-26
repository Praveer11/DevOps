provider "aws" {
  region = "ap-south-1" # change this to your preferred AWS region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"

//Subnet are variable
  subnets         = ["subnet-024631cfafaf44364", "subnet-09c72b149d4cac430"]

//VPCs are variable
  vpc_id          = "vpc-0bcd141bf5bb196c2" 
  cluster_version = "1.21"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      
//Keys are variable
      key_name = "eks-03" 
    }
  }
}