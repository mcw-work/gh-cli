#!/usr/bin/env bash

set -euo pipefail

sdk_root="${SDK:-/var/lib/workshop/sdk/gh-cli}"
workshop_user_home="/home/workshop"
gh_config_dir="$workshop_user_home/.config/gh"

find_sdk_archive_dir() {
  # The dump plugin extracts the tarball contents flat into the SDK root,
  # so bin/gh lives at $sdk_root/bin/gh directly.
  if [[ -x "$sdk_root/bin/gh" ]]; then
    printf '%s\n' "$sdk_root"
  fi
}

find_gh_binary() {
  local archive_dir

  archive_dir="$(find_sdk_archive_dir)"
  if [[ -z "$archive_dir" ]]; then
    return 1
  fi

  if [[ ! -x "$archive_dir/bin/gh" ]]; then
    return 1
  fi

  printf '%s\n' "$archive_dir/bin/gh"
}
