


# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "kojitechs-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = slice(data.aws_availability_zones.available.names, 0, 3)
#   private_subnets = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
#   public_subnets  = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"]

#   enable_nat_gateway = false
#   enable_vpn_gateway = false

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }