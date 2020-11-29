resource "aws_datasync_agent" "pscloud-datasync-agent" {
  for_each = var.pscloud_agents
  
  name            = each.value.name
  activation_key  = each.value.activation_key

  tags = {
    Name = "${var.pscloud_company}_task_${each.key}_${var.pscloud_env}"
  }
  
}

resource "aws_datasync_location_smb" "pscloud-datasync-location-smb" {
  for_each = var.pscloud_location_smb

  server_hostname = each.value.hostname
  subdirectory    = each.value.subdirectory

  user     = each.value.user
  password = each.value.password

  agent_arns = [ each.value.datasync_agent_arn ]

  tags = {
    Name = "${var.pscloud_company}_location_${each.key}_${var.pscloud_env}"
  }

}

resource "aws_datasync_location_s3" "pscloud-datasync-location-s3" {
  for_each = var.pscloud_location_s3

  s3_bucket_arn = each.value.s3_arn
  subdirectory  = each.value.subdirectory

  s3_config {
    bucket_access_role_arn = each.value.iam_role_arn
  }

  tags = {
    Name = "${var.pscloud_company}_location_${each.key}_${var.pscloud_env}"
  }

}

resource "aws_datasync_task" "pscloud-datasync-task" {
  for_each = var.pscloud_tasks


  destination_location_arn = each.value.destanation_arn
  name                     = "${var.pscloud_company}_${each.value.name}_${var.pscloud_env}" 
  source_location_arn      = each.value.source_arn

  options {
    bytes_per_second    = each.value.bytes_per_second
    verify_mode         = each.value.verify_mode
    posix_permissions   = "NONE"
    uid                 = "NONE"
    gid                 = "NONE"
  }

  tags = {
    Name = "${var.pscloud_company}_${each.value.name}_${var.pscloud_env}"
  }
}