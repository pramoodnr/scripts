#!/usr/bin/env bash
set -euo pipefail
python -m pip install -r app/requirements-dev.txt
ruff check app
ruff format --check app
pytest app/tests -q
terraform fmt -check -recursive terraform
(cd terraform/environments/dev && terraform init -backend=false && terraform validate)
kubectl kustomize k8s/overlays/dev >/tmp/devops-portfolio-rendered.yaml
echo "Validation completed successfully."
