#!/usr/bin/env bash
set -e

PART=${1:? "Need manifest part number"}
MANIFEST_REPO=${2:-"https://github.com/Ryouse1/android"}
MANIFEST_FILE="manifest-part-${PART}.xml"
WORKDIR=~/aosp

mkdir -p "$WORKDIR"
cd "$WORKDIR"

export PATH=~/bin:$PATH

if ! command -v repo >/dev/null; then
  curl -sSf https://storage.googleapis.com/git-repo-downloads/repo -o ~/bin/repo
  chmod +x ~/bin/repo
fi

repo init -u "$MANIFEST_REPO" -m "$MANIFEST_FILE" --depth=1
repo sync -j8 -c --no-tags --optimized-fetch || {
  echo "repo sync failed."
  exit 1
}
