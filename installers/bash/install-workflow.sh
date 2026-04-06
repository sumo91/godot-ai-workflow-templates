#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
available_platforms="claude codex cursor trae"

print_usage() {
  echo "Usage: install-workflow.sh <platform> <project-path> [--force]"
}

normalize_lower() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]'
}

platform_exists() {
  case "$1" in
    claude|codex|cursor|trae) return 0 ;;
    *) return 1 ;;
  esac
}

resolve_platform() {
  local requested="${1:-}"
  local env_platform="${WORKFLOW_INSTALL_PLATFORM:-}"
  local selection

  if [ -n "$requested" ]; then
    selection="$(normalize_lower "$requested")"
    if ! platform_exists "$selection"; then
      echo "Invalid platform: $requested" >&2
      exit 1
    fi
    printf '%s\n' "$selection"
    return
  fi

  if [ -n "$env_platform" ]; then
    selection="$(normalize_lower "$env_platform")"
    if ! platform_exists "$selection"; then
      echo "Invalid WORKFLOW_INSTALL_PLATFORM value: $env_platform" >&2
      exit 1
    fi
    printf '%s\n' "$selection"
    return
  fi

  echo "Select the platform to install:"
  echo "[1] claude"
  echo "[2] codex"
  echo "[3] cursor"
  echo "[4] trae"

  while true; do
    read -r -p "Enter the number or platform name: " selection
    selection="$(normalize_lower "$selection")"

    case "$selection" in
      1) printf 'claude\n'; return ;;
      2) printf 'codex\n'; return ;;
      3) printf 'cursor\n'; return ;;
      4) printf 'trae\n'; return ;;
    esac

    if platform_exists "$selection"; then
      printf '%s\n' "$selection"
      return
    fi

    echo "Invalid selection. Choose 1-4 or a platform name."
  done
}

resolve_project_path() {
  local requested="${1:-}"
  local env_path="${WORKFLOW_INSTALL_PROJECT_PATH:-}"
  local system_name
  local selected_path

  if [ -n "$requested" ]; then
    printf '%s\n' "$requested"
    return
  fi

  if [ -n "$env_path" ]; then
    printf '%s\n' "$env_path"
    return
  fi

  system_name="$(uname -s 2>/dev/null || echo unknown)"

  if [ "$system_name" = "Darwin" ] && command -v osascript >/dev/null 2>&1; then
    selected_path="$(osascript -e 'set chosenFolder to choose folder with prompt "Select your Godot project folder"' -e 'POSIX path of chosenFolder' 2>/dev/null || true)"
    if [ -n "$selected_path" ]; then
      printf '%s\n' "$selected_path"
      return
    fi
  fi

  if [ "$system_name" = "Linux" ] && command -v zenity >/dev/null 2>&1; then
    selected_path="$(zenity --file-selection --directory --title='Select your Godot project folder' 2>/dev/null || true)"
    if [ -n "$selected_path" ]; then
      printf '%s\n' "$selected_path"
      return
    fi
  fi

  if [ "$system_name" = "Linux" ] && command -v kdialog >/dev/null 2>&1; then
    selected_path="$(kdialog --getexistingdirectory . 2>/dev/null || true)"
    if [ -n "$selected_path" ]; then
      printf '%s\n' "$selected_path"
      return
    fi
  fi

  while true; do
    read -r -p "Enter the path to your Godot project: " selected_path
    if [ -n "$selected_path" ]; then
      printf '%s\n' "$selected_path"
      return
    fi
  done
}

resolve_overwrite_mode() {
  local cli_force="${1:-}"
  local env_overwrite="${WORKFLOW_INSTALL_OVERWRITE:-}"
  local selection

  if [ "$cli_force" = "--force" ]; then
    printf 'overwrite\n'
    return
  fi

  if [ -n "$env_overwrite" ]; then
    selection="$(normalize_lower "$env_overwrite")"
    case "$selection" in
      overwrite|force|yes|y|true|1)
        printf 'overwrite\n'
        return
        ;;
      skip|no|n|false|0)
        printf 'skip\n'
        return
        ;;
      *)
        echo "Invalid WORKFLOW_INSTALL_OVERWRITE value: $env_overwrite" >&2
        exit 1
        ;;
    esac
  fi

  if [ -t 0 ]; then
    while true; do
      read -r -p "Overwrite existing files when they already exist? [y/N]: " selection
      selection="$(normalize_lower "$selection")"
      case "$selection" in
        y|yes) printf 'overwrite\n'; return ;;
        ""|n|no) printf 'skip\n'; return ;;
      esac
    done
  fi

  printf 'skip\n'
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
  print_usage
  exit 0
fi

platform_arg="${1:-}"
project_path_arg="${2:-}"
force_flag="${3:-}"
platform="$(resolve_platform "$platform_arg")"
project_path="$(resolve_project_path "$project_path_arg")"
overwrite_mode="$(resolve_overwrite_mode "$force_flag")"
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

find "$template_root" -type f -print0 | while IFS= read -r -d '' file; do
  rel="${file#$template_root/}"
  dest="$project_path/$rel"
  dest_dir="$(dirname "$dest")"
  mkdir -p "$dest_dir"

  if [ -f "$dest" ] && [ "$overwrite_mode" != "overwrite" ]; then
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
