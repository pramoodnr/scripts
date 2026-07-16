#!/usr/bin/env bash
set -euo pipefail
ENVIRONMENT="${1:-dev}"
REPOSITORY="${2:?Usage: deploy.sh <environment> <ecr-repository-url> <tag>}"
TAG="${3:?Usage: deploy.sh <environment> <ecr-repository-url> <tag>}"
kubectl apply -k k8s/base
kubectl -n devops-portfolio set image deployment/portfolio-api api="$REPOSITORY:$TAG"
kubectl -n devops-portfolio rollout status deployment/portfolio-api --timeout=300s
echo "Deployed $REPOSITORY:$TAG to $ENVIRONMENT"
