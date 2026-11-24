#!/bin/zsh
set -eu
cd -- "${0:A:h}"
app='Swipe Assist.app'
mkdir -p "$app/Contents/MacOS"
cp Info.plist "$app/Contents/Info.plist"
swiftc -module-cache-path "${TMPDIR:-/tmp}/swipe-assist-modules" -target arm64-apple-macosx26.0 -parse-as-library -O Main.swift -o "$app/Contents/MacOS/SwipeAssist"
codesign --force --sign - --identifier local.swipe.assist "$app"
if [[ "${1:-}" == --test ]]; then
  "$app/Contents/MacOS/SwipeAssist" --test
fi
