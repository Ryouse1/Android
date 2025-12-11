# Android AOSP MAX Clone (Codespaces)

This repo is configured to clone **AOSP in maximum possible scale** using  
**GitHub Codespaces + manifest splitting + optional external storage mount**.

## Usage

### 1. Open in Codespaces
Choose the **largest available machine**.

### 2. (Optional) Mount large external storage
./scripts/mount_remote_storage.sh <user> <host> <dir>

### 3. Sync one manifest part
./scripts/sync_part.sh 1 https://github.com/YOUR_USERNAME/android

### 4. Run one Codespace per manifest part
This allows distributed giant clone.
./scripts/split_manifest.py default.xml 6 manifests
Put `manifest-part-*.xml` in `/manifests`.

Logs will be created under `.repo/repo.log`.
