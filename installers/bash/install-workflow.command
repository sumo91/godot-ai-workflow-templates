#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
exit_code=0

if ! "$script_dir/install-workflow.sh" "$@"; then
  exit_code=$?
fi

echo
if [ "$exit_code" -eq 0 ]; then
echo "Installation finished."
else
  echo "Installation failed with exit code $exit_code."
fi

echo
read -r -p "Press Enter to close..." || true
exit "$exit_code"
