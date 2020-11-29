variable "pscloud_env" {}
variable "pscloud_company" {}
variable "pscloud_purpouse" {}

variable "pscloud_agents" {
    type = map(object({
        name = string
        activation_key  = string  
    }))
    default = {          
    }
}

variable "pscloud_tasks" {
    type = map(object({
        name                = string 
        source_arn          = string
        destanation_arn     = string
        bytes_per_second    = number
        verify_mode         = string
    }))
    default = {        
    }
}

variable "pscloud_location_smb" {
    type = map(object({
        hostname            = string
        subdirectory        = string
        user                = string
        password            = string
        datasync_agent_arn  = string 
    }))
    default = {        
    }
}

variable "pscloud_location_s3" {
    type = map(object({
        s3_arn              = string
        subdirectory        = string
        iam_role_arn        = string
    }))
    default = {        
    }
}
variable "pscloud_location_nfs" {
    default = {        
    }
}



