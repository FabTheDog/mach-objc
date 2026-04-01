#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Fetching latest xcode-frameworks revision..."
LATEST=$(git ls-remote https://code.hexops.org/hexops/xcode-frameworks HEAD | cut -f1)
echo "  Latest: $LATEST"

CURRENT=$(grep -o 'hexops/xcode-frameworks [0-9a-f]\{40\}' generate.sh | awk '{print $2}')
echo "  Current: $CURRENT"

if [ "$CURRENT" = "$LATEST" ]; then
    echo "Already up to date."
    exit 0
fi

sed -i.bak "s|$CURRENT|$LATEST|g" generate.sh && rm -f generate.sh.bak
echo "Updated generate.sh. Run ./generate.sh to regenerate."
