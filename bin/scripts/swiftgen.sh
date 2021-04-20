#!/bin/sh

if [ $SWIFT_GEN_INPUT = "Asset" ]; then
  swiftgen config run --config ./.swiftgen.yml --verbose
else
  echo "warning: not in project dic"
fi
