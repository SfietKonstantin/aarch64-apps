#!/usr/bin/env bash

set -euxo pipefail

RELEASE="4.0.1.45"

# Apply patches
for f in patches/*.patch
do
patch -p1 < "$f"
done

mkdir -p RPMS

# Build package in docker
# From https://github.com/CODeRUS/github-sfos-build/blob/master/build.sh
docker run --rm --privileged \
  -v $PWD:/workspace \
  "coderus/sailfishos-platform-sdk-aarch64:${RELEASE}" \
  "/bin/bash" "/workspace/build-docker.sh" "$1"
