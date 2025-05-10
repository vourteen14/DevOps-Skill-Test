# Description
This manifest for creating VPC and GKE that managed using terraform

# Variables
- Ensure that gcloud is installed on the system and the user is authenticated with GCP
- Ensure terraform already installed on the system
- on variables.tf
  - change the project_id
  - change the region
  - change the zone

# Initialization
terraform init

# Plan
terraform plan

# Apply
terraform apply -auto-approve