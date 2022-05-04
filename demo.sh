#!/bin/bash

BRANCH="Add_GCP_Firewall_Config_${RANDOM}"

########################
# include the magic
########################
. ./demo-magic/demo-magic.sh

# hide the evidence
clear

# Run Terraform Plan
pe "terraform plan"

# Create Branch
pe "git checkout -b ${BRANCH}"

# Change Configuration
pe "vi main.tf"

# Run Terraform Plan
pe "terraform plan"

# Stage the changes
pe "git add ."

# Commit the changes
pe "git commit -m 'Update GCP Firewall Security'"

# Push the changes
pe "git push origin ${BRANCH}"

# Create Pull Request
pe "gh pr create \\
--title 'Update firewall config security' \\
--body 'This PR closes the open access' \\
--label 'enhancement'"
