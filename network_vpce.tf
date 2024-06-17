# module "vpce_ssm" {
#   source = "./modules/vpce/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   vpce_service = "ssm"
#   #Type = "Gateway"
#   subnet_filter = "app"
#   vpce_sg_ids = [
#     module.sg_vpce.security_group_ids
#   ]
# }

# module "vpce_ssmmessages" {
#   source = "./modules/vpce/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   vpce_service = "ssmmessages"
#   #Type = "Gateway"
#   subnet_filter = "app"
#   vpce_sg_ids = [
#     module.sg_vpce.security_group_ids
#   ]
# }

# module "vpce_ec2messages" {
#   source = "./modules/vpce/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   vpce_service = "ec2messages"
#   #Type = "Gateway"
#   subnet_filter = "app"
#   vpce_sg_ids = [
#     module.sg_vpce.security_group_ids
#   ]
# }