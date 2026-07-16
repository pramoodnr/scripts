#!/usr/bin/env bash
set -euo pipefail
read -r -p "Destroy the dev AWS infrastructure? Type destroy: " answer
[[ "$answer" == "destroy" ]] || { echo "Cancelled"; exit 1; }
terraform -chdir=terraform/environments/dev destroy
