#!/usr/bin/env bash
set -euo pipefail

# hyprlock-minimal preview and validation helper
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHECK_ONLY=false
CONFIG_FILE="$SCRIPT_DIR/hyprlock.conf"
GRACE=5

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)
      CHECK_ONLY=true
      shift
      ;;
    --grace)
      GRACE="${2:-5}"
      shift 2
      ;;
    -h|--help)
      echo "Usage: ./preview.sh [OPTIONS] [CONFIG_FILE]"
      echo ""
      echo "Options:"
      echo "  --check        Validate configuration syntax without launching hyprlock"
      echo "  --grace SECS   Set unlock grace period in seconds (default: 5)"
      echo "  -h, --help     Show this help message"
      exit 0
      ;;
    *)
      CONFIG_FILE="$1"
      shift
      ;;
  esac
done

echo "==> hyprlock-minimal validation & preview"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: Config file not found at: $CONFIG_FILE" >&2
  exit 1
fi

echo "-> Validating config structure in $CONFIG_FILE..."
errors=0

# Verify required core sections
for section in "background" "input-field" "label"; do
  if ! grep -q -E "^[[:space:]]*${section}[[:space:]]*\{" "$CONFIG_FILE"; then
    echo "  [FAIL] Missing required section: '${section}'" >&2
    errors=$((errors + 1))
  else
    echo "  [PASS] Section '${section}' found."
  fi
done

# Verify color syntax formatting
if grep -q -E "rgba?\([^\)]*$" "$CONFIG_FILE"; then
  echo "  [FAIL] Unclosed color syntax detected." >&2
  errors=$((errors + 1))
else
  echo "  [PASS] Color formats valid."
fi

if [[ $errors -gt 0 ]]; then
  echo "Error: Validation failed with $errors error(s)." >&2
  exit 1
fi

echo "✓ Configuration syntax check passed."

if [[ "$CHECK_ONLY" == "true" || "${CI:-}" == "true" ]]; then
  exit 0
fi

if ! command -v hyprlock >/dev/null 2>&1; then
  echo "Note: 'hyprlock' binary not found in PATH. Install hyprlock to run live visual preview."
  exit 0
fi

echo "-> Launching safe preview (Grace period: ${GRACE}s)..."
echo "-> Press any key / move mouse within ${GRACE}s or enter password to unlock."
exec hyprlock --config "$CONFIG_FILE" --grace "$GRACE"
