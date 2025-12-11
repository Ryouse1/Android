FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git-core curl python3 python3-pip openjdk-11-jdk-headless rsync sshfs jq unzip build-essential \
 && rm -rf /var/lib/apt/lists/*

# repo をユーザ bin に入れる（install_repo.sh でも冗長インストール）
RUN mkdir -p /home/vscode/bin && curl https://storage.googleapis.com/git-repo-downloads/repo > /home/vscode/bin/repo \
 && chmod a+x /home/vscode/bin/repo && chown -R vscode:vscode /home/vscode/bin

ENV PATH=/home/vscode/bin:$PATH
