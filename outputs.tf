output "first_server_name" {
  description = "Name of the first server"
  value       = fakewebservices_server.servers[0].name
}


output "second_server_name" {
  description = "Name of the second server"
  value       = fakewebservices_server.servers[1].name
}
