#!/usr/bin/env bash
set -euo pipefail
for command in aws terraform kubectl docker; do command -v "$command" >/dev/null || { echo "Missing $command" >&2; exit 1; }; done
aws sts get-caller-identity >/dev/null
echo "Prerequisites and AWS authentication verified."
