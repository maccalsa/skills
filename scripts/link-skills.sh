#!/usr/bin/env bash
set -euo pipefail

# Maintainer helper: symlink active skills into local agent skill directories.
# End users should prefer `npx skills@latest add maccalsa/skills`.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
if [ "${SKILLS_DESTS:-}" != "" ]; then
  IFS=':' read -r -a DESTS <<< "$SKILLS_DESTS"
else
  DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")
fi

names=()
srcs=()
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  names+=("$(basename "$src")")
  srcs+=("$src")
done < <(find "$REPO/skills" -name SKILL.md -not -path '*/node_modules/*' -not -path '*/deprecated/*' -not -path '*/in-progress/*' -print0)

for DEST in "${DESTS[@]}"; do
  if [ -L "$DEST" ]; then
    resolved="$(readlink -f "$DEST")"
    case "$resolved" in
      "$REPO"|"$REPO"/*)
        echo "error: $DEST is a symlink into this repo ($resolved)." >&2
        echo "Remove it and re-run so the script can create a real directory." >&2
        exit 1
        ;;
    esac
  fi

  mkdir -p "$DEST"
  for i in "${!names[@]}"; do
    name="${names[$i]}"
    src="${srcs[$i]}"
    target_path="$DEST/$name"
    if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
      echo "skipping $target_path: exists and is not a symlink" >&2
      continue
    fi
    ln -sfn "$src" "$target_path"
    echo "linked $name -> $src ($DEST)"
  done
done
