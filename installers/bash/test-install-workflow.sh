#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
installer_path="$script_dir/install-workflow.sh"
temp_base="$script_dir/.tmp-tests"
mkdir -p "$temp_base"
temp_root="$(mktemp -d "$temp_base/godot-ai-workflow-bash-test-XXXXXX")"
project_path="$temp_root/project"
platform="${WORKFLOW_TEST_PLATFORM:-codex}"
expected_relative_path="${WORKFLOW_TEST_EXPECTED_FILE:-AGENTS.md}"
expected_file="$project_path/$expected_relative_path"

cleanup() {
  unset WORKFLOW_INSTALL_PLATFORM || true
  unset WORKFLOW_INSTALL_PROJECT_PATH || true
  unset WORKFLOW_INSTALL_OVERWRITE || true
  rm -rf "$temp_root"
}

trap cleanup EXIT

mkdir -p "$project_path"

export WORKFLOW_INSTALL_PLATFORM="$platform"
export WORKFLOW_INSTALL_PROJECT_PATH="$project_path"

"$installer_path"

if [ ! -f "$expected_file" ]; then
  echo "Expected installed file was not found: $expected_file" >&2
  exit 1
fi

echo "PASS: parameterless bash installer flow installed $platform starter into $project_path"
