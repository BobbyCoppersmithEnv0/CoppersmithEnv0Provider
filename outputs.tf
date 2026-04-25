# Terraform outputs
output "project_id" {
  description = "The ID of the created env0 project"
  value       = env0_project.this.id
}

output "project_name" {
  description = "The name of the created env0 project"
  value       = env0_project.this.name
}

output "admin_team_assignments" {
  description = "Teams granted Admin access and their assignment IDs"
  value       = { for k, v in env0_team_project_assignment.admin : k => v.id }
}

output "viewer_team_assignments" {
  description = "Teams granted Viewer access and their assignment IDs"
  value       = { for k, v in env0_team_project_assignment.viewer : k => v.id }
}
