# outputs.tf

output "master_ip" {
  description = "Public IP address of the master node"
  value       = aws_instance.master.public_ip
}

output "worker1_ip" {
  description = "Public IP address of Worker 1 node"
  value       = aws_instance.worker1.public_ip
}

output "worker2_ip" {
  description = "Public IP address of Worker 2 node"
  value       = aws_instance.worker2.public_ip
}

output "masterp_ip" {
  description = "Private IP address of the master node"
  value       = aws_instance.master.private_ip
}
