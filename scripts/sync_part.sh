#!/usr/bin/env bash
set -euo pipefail
PART=${1:-1}
MANIFEST_REPO=${2:-"https://github.com/youruser/aosp-codespace-manifests.git"}
MANIFEST_FILE="manifest-part-${PART}.xml"
WORKDIR=~/aosp
mkdir -p $WORKDIR
cd $WORKDIR

# Ensure repo exists
export PATH=~/bin:$PATH
if ! command -v repo >/dev/null; then
  curl -sSf https://storage.googleapis.com/git-repo-downloads/repo -o ~/bin/repo
  chmod a+x ~/bin/repo
fi

# Init (shallow) - depth=1 to reduce history size
repo init -u ${MANIFEST_REPO} -m ${MANIFEST_FILE} --depth=1
# Sync with optimized flags (shallow, no tags, current branch only)
repo sync -j8 -c --no-tags --optimized-fetch || {
  echo "repo sync failed or got interrupted; inspect .repo/repo.log"
  exit 1
}
