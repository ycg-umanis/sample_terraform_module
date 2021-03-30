locals {

  regions = {
    "France Central" = "FRANCE"
    "France South"   = "FRANCE"
    "West Europe"    = "EUROPE"
    "North Europe"   = "EUROPE"
  }

  client_safe  = upper(var.client)
  project_safe = upper(var.project)
  region_safe  = lookup(local.regions, var.geozone, "-What-")
  budget_safe  = upper(var.budget)

  tags = {
    "U_CLIENT"  = local.client_safe
    "U_PROJECT" = local.project_safe
    "U_REGION"  = local.region_safe
    "U_BUDGET"  = local.budget_safe
    "U_RGPD"    = var.rgpd_confidential ? "CONFIDENTIAL" : (var.rgpd_personal ? "PERSONAL" : "BUSINESS")
  }
}