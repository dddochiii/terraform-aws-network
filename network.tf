## VPC & IGW ##
module "test_vpc" {
  source = "./modules/vpc/v0.1"

  vpc_cidr = "192.168.0.0/16"
  vpc_purpose = "test"
  attach_igw = true
}

## NAT Gateway & EIP ##
module "test_nat_az_a" {
  source = "./modules/nat/v0.1"

  public_yn = true
  nat_purpose = "test"
  nat_subnet_id = ""
}

module "test_nat_az_c" {
  source = "./modules/nat/v0.1"

  public_yn = true
  nat_purpose = "test"
  nat_subnet_id = ""
}

## Subnet ##
module "test_sbn" {
  source = "./modules/sbn/v0.1"

  vpc_id = module.test_vpc.vpc_id

  # [{Availabilty Zone Code}, {Subnet CIDR}, {Subnet Purpose}]
  input_values = [
    ["an2a", "192.168.0.0/24", "dmz"],
    ["an2c", "192.168.1.0/24", "dmz"],
    ["an2a", "192.168.2.0/24", "app"],
    ["an2c", "192.168.3.0/24", "app"]
  ]
}

## Route Table ##
module "test_rt_dmz" {
  source = "./modules/rt/v0.1"
  rt_purpose = "dmz"
  rt_filter = "dmz"       # Finding Route Table to associate
  vpc_id = module.test_vpc.vpc_id

  # [{Destination CIDR},{Destination ID}]
  routing_rule = [
    ["0.0.0.0/0", "igw"]  # igw → VPC에 연결된 Internet Gateway / vgw → VPC에 연결된 Virtual Private Gateway
  ]
}

module "test_rt_app_a" {
  source = "./modules/rt/v0.1"
  rt_purpose = "app"
  rt_filter = "app-a"       # Finding Route Table to associate
  vpc_id = module.test_vpc.vpc_id

  # [{Destination CIDR},{Destination ID}]
  routing_rule = [
    ["0.0.0.0/0", module.test_nat_az_a.gateway_id]  # igw → VPC에 연결된 Internet Gateway / vgw → VPC에 연결된 Virtual Private Gateway
  ]
}

module "test_rt_app_c" {
  source = "./modules/rt/v0.1"
  rt_purpose = "app"
  rt_filter = "app-c"       # Finding Route Table to associate
  vpc_id = module.test_vpc.vpc_id

  # [{Destination CIDR},{Destination ID}]
  routing_rule = [
    ["0.0.0.0/0", module.test_nat_az_c.gateway_id]  # igw → VPC에 연결된 Internet Gateway / vgw → VPC에 연결된 Virtual Private Gateway
  ]
}