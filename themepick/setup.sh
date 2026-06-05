#!/bin/bash
set -euo pipefail

# ── prereq reminder ────────────────────────────────────────────────────────────
cat <<'EOF'
╔══════════════════════════════════════════════════════════════╗
║                    ⚠  PREREQUISITES  ⚠                       ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║   This script assumes you have the following installed:      ║
║                                                              ║
║     • fzf  – fuzzy finder (for kitty)                        ║
║     • wofi – application launcher / menu (for other terms)   ║
║     • pywal – for setting term colors                        ║
║                                                              ║
║   Install them before running this script:                   ║
║                                                              ║
║     sudo pacman -Syu fzf wofi python-pywal                   ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
EOF

read -rp "Press Enter to continue, or Ctrl-C to abort…"

echo
echo "==> Starting themepick installation"

# ── directory helpers ──────────────────────────────────────────────────────────
create_and_copy() {
    local dest="$1"
    local src="$2"
    local label="$3"

    if [[ ! -d "$dest" ]]; then
        echo "  [+] Creating directory: $dest"
        mkdir -p "$dest"
    else
        echo "  [•] Directory already exists: $dest"
    fi

    echo "  [+] Copying $label to $dest"
    cp -r "$src"/* "$dest"/
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ── helper scripts ────────────────────────────────────────────────────────────
echo
echo "── Deploying helper scripts"
create_and_copy \
    "$HOME/.local/scripts/helpers" \
    "$SCRIPT_DIR/helpers" \
    "helper scripts"

# ── previews ───────────────────────────────────────────────────────────────────
echo
echo "── Deploying theme previews"
create_and_copy \
    "$HOME/.local/share/themepick/previews" \
    "$SCRIPT_DIR/previews" \
    "preview images"

# ── wallpapers ─────────────────────────────────────────────────────────────────
echo
echo "── Deploying wallpapers"
create_and_copy \
    "$HOME/Pictures/Wallpapers" \
    "$SCRIPT_DIR/wallpapers" \
    "wallpapers"

# ── wal colourschemes ──────────────────────────────────────────────────────────
echo
echo "── Deploying wal colourschemes"
create_and_copy \
    "$HOME/.config/wal/colorschemes/dark" \
    "$SCRIPT_DIR/walthemes" \
    "wal theme JSON files"

# ── main script ────────────────────────────────────────────────────────────────
echo
echo "── Deploying themepick script"
cp "$SCRIPT_DIR/themepick" "$HOME/.local/scripts/themepick"
chmod +x "$HOME/.local/scripts/themepick"
echo "  [+] Copied themepick → $HOME/.local/scripts/themepick"

echo
echo "==> Installation complete"
echo "REMEMBER TO ADD '[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences' to your shellfile (pywal)"
