output "pscloud_datasync_agents" {
  value       = {
      for a in aws_datasync_agent.pscloud-datasync-agent:
      a.name => a
  }
}

output "pscloud_datasync_location_smb" {
  value       = {
      for a in aws_datasync_location_smb.pscloud-datasync-location-smb:
      a.tags.Name => a
  }
}

output "pscloud_datasync_location_s3" {
  value       = {
      for a in aws_datasync_location_s3.pscloud-datasync-location-s3:
      a.tags.Name => a
  }
}