# module "sg_bastion" {
#   source = "./modules/sg/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   sg_purpose = "bastion"
  
#   # [{Protocol}, {Port}, {CIDR}, {Description}]
#   ingress_rule = [
#     ["ssh", 22, module.sg_bastion.security_group_ids, "Access from Bastion to Private Network"],
#   ]
#   egress_rule = [
#     [-1, 0, "0.0.0.0/0", "Bastion Outbound"],
#   ]
# }

# module "sg_mgmt" {
#   source = "./modules/sg/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   sg_purpose = "mgmt"
  
#   # [{Protocol}, {Port}, {CIDR}, {Description}]
#   ingress_rule = [
#     ["ssh", 22, module.sg_bastion.security_group_ids, "Access from Bastion to Private Network"],
#   ]
#   egress_rule = [
#     [-1, 0, "0.0.0.0/0", "Bastion Outbound"],
#   ]
  
# }

# module "sg_vpce" {
#   source = "./modules/sg/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   sg_purpose = "vpce"
  
#   # [{Protocol}, {Port}, {CIDR}, {Description}]
#   ingress_rule = [
#     ["tcp", 443, module.test_vpc.cidr_block, "Access to VPC Endpoint"],
#   ]
#   egress_rule = [
#     [-1, 0, "0.0.0.0/0", "VPC Endpoint Outbound"],
#   ]
# }

# module "sg_app" {
#   source = "./modules/sg/v0.1"

#   vpc_id = module.test_vpc.vpc_id
#   sg_purpose = "app"
  
#   # [{Protocol}, {Port}, {CIDR}, {Description}]
#   ingress_rule = [
#     ["tcp", 80, module.test_vpc.cidr_block, "Access to Service"],
#   ]

#   egress_rule = [
#     [-1, 0, "0.0.0.0/0", "Application Outbound"],
#   ]
# }

# module "sg_lb" {
#   source = "./modules/sg/v0.1"
  
#   vpc_id = module.test_vpc.vpc_id
#   sg_purpose = "lb"
  
#   # [{Protocol}, {Port}, {CIDR}, {Description}]
#   ingress_rule = [
#     ["tcp", 80, module.test_vpc.cidr_block, "Access to Service"],
#     ["tcp", 80, var.ucloud_nat_ip, "Ucloud Access to Service"],
#   ]

#   egress_rule = [
#     [-1, 0, "0.0.0.0/0", "LB Outbound"],
#   ]
# }