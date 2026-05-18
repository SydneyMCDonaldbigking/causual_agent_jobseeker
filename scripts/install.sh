#!/usr/bin/env bash
set -euo pipefail

DESTINATION="${1:-$HOME/.hermes-jobseeker-skills}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$DESTINATION"
rm -rf "$DESTINATION/skills" "$DESTINATION/examples"
cp -R "$REPO_ROOT/skills" "$DESTINATION/skills"
cp -R "$REPO_ROOT/examples" "$DESTINATION/examples"

echo "Installed Hermes jobseeker skills to $DESTINATION"
