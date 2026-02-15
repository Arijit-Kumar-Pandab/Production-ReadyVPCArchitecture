output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "bastion_public_ip" {
  description = "Bastion Host Public IP"
  value       = aws_instance.bastion_host.public_ip
}

output "private_instance_private_ip" {
  description = "Private Instance Private IP"
  value       = aws_instance.web_server.private_ip
}

output "private_key_path" {
  description = "Path to private key file"
  value       = local_file.private_key.filename
}

output "key_pair_name" {
  description = "Key Pair Name"
  value       = aws_key_pair.main.key_name
}
