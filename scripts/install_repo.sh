#!/usr/bin/env bash
set -e
mkdir -p ~/bin
curl -sSf https://storage.googleapis.com/git-repo-downloads/repo -o ~/bin/repo
chmod +x ~/bin/repo
echo "repo installed at $(which repo)"
