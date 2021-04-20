#!/bin/sh
INPUT="$1"
OUTPUT="$INPUT/Assets/SwiftGen"

if [ "$INPUT" = "Asset" ]; then
  swiftgen strings $INPUT/Assets/en.lproj/localizable.strings --output $OUTPUT/Strings.swift --templatePath $TEMPLATES/Strings.stencil
  swiftgen fonts Axis_Assets/Fonts --output $OUTPUT/Fonts.swift --templatePath $TEMPLATES/Fonts.stencil
else
  swiftgen storyboards $INPUT --output $OUTPUT/Storyboards.swift --templatePath $TEMPLATES/Storyboards.stencil
fi

swiftgen xcassets $INPUT/Assets/Assets.xcassets --output $OUTPUT/Assets.swift --templatePath $TEMPLATES/Assets.stencil
