#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(dirname "$SCRIPT_DIR")"

echo "Building CasePathsMacros..."
cd "$PACKAGE_DIR"
swift build -c release

echo "Copying binary to Macros/"
mkdir -p Macros
cp .build/release/CasePathsMacros-tool Macros/CasePathsMacros

echo "Verifying binary..."
lipo -info Macros/CasePathsMacros

echo "Done! Macro binary updated at: Macros/CasePathsMacros"
