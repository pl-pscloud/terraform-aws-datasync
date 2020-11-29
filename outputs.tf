output "pscloud_datasync_agents" {
  value       = aws_datasync_agent.pscloud-datasync-agent
}

output "pscloud_datasync_tasks" {
  value = aws_datasync_task.pscloud-datasync-task
}

output "pscloud_datasync_location_smb" {
  value = aws_datasync_location_smb.pscloud-datasync-location-smb
}

output "pscloud_datasync_location_s3" {
  value = aws_datasync_location_s3.pscloud-datasync-location-s3
}

