output "endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.postgres.endpoint
}
