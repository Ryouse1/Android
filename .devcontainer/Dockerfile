FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git-core curl sshfs python3 python3-pip \
    openjdk-11-jdk-headless \
    build-essential gcc g++ make unzip rsync jq \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/vscode/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /home/vscode/bin/repo
RUN chmod a+x /home/vscode/bin/repo
ENV PATH=/home/vscode/bin:$PATH
