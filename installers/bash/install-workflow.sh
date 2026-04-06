#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: install-workflow.sh <platform> <project-path> [--force]"
  exit 1
fi

platform="$1"
project_path="$2"
force_flag="${3:-}"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
template_root="$repo_root/templates/${platform}-godot-project"
smoke_test_path="$repo_root/smoke-tests/${platform}/README.zh-CN.md"

if [ ! -d "$template_root" ]; then
  echo "Template not found: $template_root"
  exit 1
fi

if [ ! -d "$project_path" ]; then
  echo "Project path does not exist: $project_path"
  exit 1
fi

find "$template_root" -type f | while read -r file; do
  rel="${file#$template_root/}"
  dest="$project_path/$rel"
  dest_dir="$(dirname "$dest")"
  mkdir -p "$dest_dir"

  if [ -f "$dest" ] && [ "$force_flag" != "--force" ]; then
    echo "Skip existing file: $rel"
    continue
  fi

  cp "$file" "$dest"
  echo "Installed: $rel"
done

echo
echo "Installed $platform workflow starter into:"
echo "$project_path"
echo
echo "Next step:"
echo "Open your project and run the smoke test checklist at:"
echo "$smoke_test_path"
