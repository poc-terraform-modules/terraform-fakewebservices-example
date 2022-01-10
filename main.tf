resource "fakewebservices_vpc" "primary_vpc" {
  name       = var.vpc_name
  cidr_block = "0.0.0.0/1"
}

resource "fakewebservices_server" "servers" {
  count = 2

  name = "Server ${count.index + 1}"
  type = "t2.micro"
  vpc  = fakewebservices_vpc.primary_vpc.name
}

resource "fakewebservices_load_balancer" "primary_lb" {
  name    = var.load_balancer_name
  servers = fakewebservices_server.servers[*].name
}

resource "fakewebservices_database" "prod_db" {
  name = var.database_name
  size = 256
}
