# Terraform variables
variable "project_name" {
  description = "Name of the env0 project to create"
  type        = string
}

variable "project_description" {
  description = "Description of the env0 project"
  type        = string
  default     = ""
}

variable "parent_project_id" {
  description = "ID of the parent project to nest this project under. Leave empty for a top-level project."
  type        = string
  default     = null
}

variable "admin_teams" {
  description = "List of existing team names to grant Admin role on the project"
  type        = list(string)
  default     = []
}

variable "viewer_teams" {
  description = "List of existing team names to grant Viewer role on the project"
  type        = list(string)
  default     = []
}
