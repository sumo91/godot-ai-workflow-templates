#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
launcher_path="$script_dir/launch-install-workflow.sh"
temp_base="$script_dir/.tmp-tests"
mkdir -p "$temp_base"
temp_root="$(mktemp -d "$temp_base/godot-ai-workflow-launcher-test-XXXXXX")"
project_path="$temp_root/project"
expected_file="$project_path/AGENTS.md"

cleanup() {
  unset WORKFLOW_INSTALL_PLATFORM || true
  unset WORKFLOW_INSTALL_PROJECT_PATH || true
  unset WORKFLOW_INSTALL_OVERWRITE || true
  rm -rf "$temp_root"
}

trap cleanup EXIT

mkdir -p "$project_path"

export WORKFLOW_INSTALL_PLATFORM="codex"
export WORKFLOW_INSTALL_PROJECT_PATH="$project_path"

"$launcher_path"

if [ ! -f "$expected_file" ]; then
  echo "Expected installed file was not found: $expected_file" >&2
  exit 1
fi

echo "PASS: bash launcher installed starter into $project_path"
