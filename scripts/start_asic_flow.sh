#!/usr/bin/env bash
set -euo pipefail

TOP="soc_top"
LIBERTY=""
DRY_RUN=0

usage() {
  cat <<USAGE
Start ASIC synthesis flow for this SoC.

Usage:
  $0 [--top <module>] [--liberty <file.lib>] [--dry-run]

Options:
  --top       Override top module (default: soc_top)
  --liberty   Optional standard-cell liberty for technology mapping
  --dry-run   Print what would run, but do not execute
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --top)
      TOP="$2"
      shift 2
      ;;
    --liberty)
      LIBERTY="$2"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

mkdir -p build/asic

cmd=(yosys -c scripts/asic_synth.ys -q -l build/asic/yosys.log -D TOP="$TOP")
if [[ -n "$LIBERTY" ]]; then
  if [[ ! -f "$LIBERTY" ]]; then
    echo "[ERROR] Liberty file not found: $LIBERTY"
    exit 1
  fi
  cmd+=( -D LIBERTY="$LIBERTY" )
fi

echo "[INFO] Running command:"
echo "  ${cmd[*]}"

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[INFO] Dry run selected; no command executed."
  exit 0
fi

if ! command -v yosys >/dev/null 2>&1; then
  echo "[ERROR] yosys is not installed or not in PATH."
  echo "Install yosys first, then rerun this script."
  exit 1
fi

"${cmd[@]}"

echo "[INFO] ASIC synthesis flow completed."
echo "[INFO] Reports and netlists are available under build/asic/."
