#!/usr/bin/env bash

set -euxo pipefail

# Apply patches
for f in patches/*.patch
do
patch -p1 -l -i "$f"
done
