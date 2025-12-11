#!/usr/bin/env bash
set -euo pipefail
echo "Installing repo tool..."
mkdir -p ~/bin
curl -sSf https://storage.googleapis.com/git-repo-downloads/repo -o ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH
echo "repo installed at $(which repo)"
