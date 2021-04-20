#!/bin/sh
pwd
if [ $SWIFT_GEN_INPUT = "Asset" ]; then
  echo "sdakjshdjahsdk----"
  swiftgen config run --config ./.swiftgen.yml --verbose
else
  echo "warning: not in project dic"
fi
