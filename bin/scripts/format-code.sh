#!/bin/sh

if [ "$1" == "" ]; then
  echo "missing directory"
  exit 1
fi

if which swiftlint >/dev/null; then
  swiftlint lint --path $1 --config ../.swiftlint.yml
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

if which swiftformat >/dev/null; then
  swiftformat $1 --stripunusedargs closure-only --disable blankLinesAtStartOfScope --patternlet inline
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

