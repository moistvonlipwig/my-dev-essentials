#!/bin/bash
REPOS_DIR=${1:-.}
for repo in "$REPOS_DIR"/*/; do
  if [ -d "$repo/.git" ]; then
    echo "=== Checking $repo ==="
    (cd "$repo" && git status --porcelain) || echo "No changes or not a Git repo"
    echo ""
  fi
done
