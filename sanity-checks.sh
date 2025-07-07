#!/usr/bin/env bash
set -euo pipefail

echo "::group::Sanity-checking workspace"

# Determine target path (custom or default workspace)
TARGET_PATH="${PATH_INPUT:-${GITHUB_WORKSPACE}}"
echo "Using path: '${TARGET_PATH}'"

# Verify path exists
if [[ ! -d "${TARGET_PATH}" ]]; then
  echo "::error ::Path '${TARGET_PATH}' does not exist or is not a directory"
  exit 1
fi

# Verify it’s a Git repo
if ! git -C "${TARGET_PATH}" rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "::error ::Path '${TARGET_PATH}' is not a valid git repository"
  exit 1
fi

echo "✔ Path '${TARGET_PATH}' is a valid Git repository"
echo "::endgroup::"
