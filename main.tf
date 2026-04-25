# Terraform main configuration

# Create the project
resource "env0_project" "this" {
  name              = var.project_name
  description       = var.project_description
  parent_project_id = var.parent_project_id
}

# Look up each admin team by name
data "env0_team" "admin_teams" {
  for_each = toset(var.admin_teams)
  name     = each.key
}

# Look up each viewer team by name
data "env0_team" "viewer_teams" {
  for_each = toset(var.viewer_teams)
  name     = each.key
}

# Assign Admin role to specified teams
resource "env0_team_project_assignment" "admin" {
  for_each = toset(var.admin_teams)

  team_id    = data.env0_team.admin_teams[each.key].id
  project_id = env0_project.this.id
  role       = "Admin"
}

# Assign Viewer role to specified teams
resource "env0_team_project_assignment" "viewer" {
  for_each = toset(var.viewer_teams)

  team_id    = data.env0_team.viewer_teams[each.key].id
  project_id = env0_project.this.id
  role       = "Viewer"
}
