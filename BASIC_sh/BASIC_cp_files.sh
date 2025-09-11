#!/usr/bin/env sh
# List .py and .ipynb files directly inside SRC_DIR (no subfolders),
# DO NOT copy anything, and write a Markdown log in DEST_DIR.
# Only the Markdown file is created.

###############################################################################
# >>> Set your paths here:
SRC_DIR="/path/to/file/"  # only files directly in this folder are listed
DEST_DIR="./"                          # must already exist; no folders will be created
LOG_MD="${DEST_DIR%/}/copy_log.md"     # markdown log file path to create/overwrite
# <<< End settings
###############################################################################

# Checks
if [ ! -d "$SRC_DIR" ]; then
  echo "Error: SRC_DIR is not a directory: $SRC_DIR" >&2
  exit 1
fi
if [ ! -d "$DEST_DIR" ]; then
  echo "Error: DEST_DIR does not exist: $DEST_DIR" >&2
  exit 1
fi

RUN_TS="$(date -u '+%Y-%m-%d %H:%M:%S %Z')"

# Count matching files (non-recursive)
COUNT="$(find "$SRC_DIR" -maxdepth 1 -type f \( -name '*.py' -o -name '*.ipynb' \) | wc -l | awk '{print $1}')"

# Start fresh log (overwrite each run)
{
  echo "# File Log"
  echo
  echo "- Run at: $RUN_TS"
  echo "- Source: \`$SRC_DIR\`"
  echo "- Destination (no copies performed): \`$DEST_DIR\`"
  echo "- Files found: $COUNT"
  echo
  echo "| File | Listed At |"
  echo "| ---- | --------- |"
} > "$LOG_MD" || {
  echo "Error: cannot write log file: $LOG_MD" >&2
  exit 1
}

# Append rows for each file (non-recursive)
find "$SRC_DIR" -maxdepth 1 -type f \( -name "*.py" -o -name "*.ipynb" \) -print | \
while IFS= read -r SRC; do
  BASENAME=$(basename "$SRC")
  NOW="$(date -u '+%Y-%m-%d %H:%M:%S %Z')"
  echo "| $BASENAME | $NOW |" >> "$LOG_MD"
done

echo "Log written to: $LOG_MD"
