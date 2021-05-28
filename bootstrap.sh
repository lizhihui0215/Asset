#!/bin/sh
echo "📦 Installing brew"
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

echo "📦 Installing swiftlint"
brew install swiftlint

echo "📦 Installing swiftgen"
brew install swiftgen

echo "📦 Installing swiftformat"
brew install swiftformat

echo "📦 Installing sourcery"
brew install sourcery

echo "📦 Installing carthage"
brew install carthage
