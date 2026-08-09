#!/usr/bin/env bash
# Simple helper to package the lambda handlers into zips (dummy)
set -euo pipefail
mkdir -p ./build
pushd ./terraform/modules/lambda/handlers >/dev/null
for f in *.py ; do
  name=$(basename "$f" .py)
  zip -j ../../${name}.zip "$f"
done
popd >/dev/null
echo "Created zips in terraform/modules/lambda/" 
