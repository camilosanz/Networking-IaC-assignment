module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "IaC-assignment-vpc"
  cidr = "192.168.0.0/20"

  azs             = ["us-east-1a"]
  private_subnets = ["192.168.0.0/23", "192.168.2.0/25", "192.168.2.128/26"]
  public_subnets  = ["192.168.2.192/26"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "IaC-assignment-sg"
  description = "Security group for peer connection"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp", "all-icmp"]
}