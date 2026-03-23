#!/usr/bin/env bash
set -euo pipefail

# Publish GitHub release using `gh` (GitHub CLI).
# Requirements: `gh` installed and authenticated (`gh auth login`), current directory is repository root.

TAG=${1:-v1.0.0}
TITLE="PQ-Chain + Ephemeral Multisig paper"
NOTES_FILE=github_release_notes.md
ASSETS=(pqchain_zenodo_bundle.zip pqchain_arxiv_source.tar.gz pqchain_iacr_bundle.zip paper.pdf)

if ! command -v gh >/dev/null 2>&1; then
  echo "gh (GitHub CLI) not found. Install from https://cli.github.com/"
  exit 2
fi

# Create release and upload assets
gh release create "$TAG" "${ASSETS[@]}" --title "$TITLE" --notes-file "$NOTES_FILE"

echo "Release $TAG created. Visit: https://github.com/<owner>/<repo>/releases/tag/$TAG (replace owner/repo)"
