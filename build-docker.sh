#!/usr/bin/env bash

set -euxo pipefail

# From https://github.com/CODeRUS/github-sfos-build/blob/master/docker.sh

mkdir -p /home/nemo/build
cd /home/nemo/build
cp -r /workspace/* /home/nemo/build

cd "apps/$1"
mb2 build
sudo cp -r RPMS/*.rpm /workspace/RPMS