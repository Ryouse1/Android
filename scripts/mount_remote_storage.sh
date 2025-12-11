#!/usr/bin/env bash
set -e

REMOTE_USER=$1
REMOTE_HOST=$2
REMOTE_DIR=${3:-/srv/aosp}
LOCAL_DIR=${4:-/workspaces/aosp-data}

sudo apt-get update && sudo apt-get install -y sshfs
mkdir -p "$LOCAL_DIR"

sshfs "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}" "$LOCAL_DIR" \
  -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3

echo "Mounted remote storage at $LOCAL_DIR"
