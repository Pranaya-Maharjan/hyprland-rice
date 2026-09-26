#!/usr/bin/env bash
set -e

# ─── Helpers ───────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

info()  { echo -e "${GREEN}==>${NC} $1"; }
warn()  { echo -e "${YELLOW}⚠️  $1${NC}"; }
error() { echo -e "${RED}❌ $1${NC}"; }

# ─── Config ────────────────────────────────────────────────────────────
REPO="https://github.com/Pranaya-Maharjan/hyprland-rice.git"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# ─── 1. Pre-flight checks ──────────────────────────────────────────────
info "Checking environment..."

# Check for git
if ! command -v git >/dev/null 2>&1; then
    error "git is not installed. Install it first:"
    echo "   sudo apt install git    # Debian/Kali"
    echo "   sudo pacman -S git      # Arch"
    exit 1
fi

# Check Hyprland version (warn if too old)
if command -v hyprland >/dev/null 2>&1; then
    HYPR_VER=$(hyprland --version 2>/dev/null | head -1 || echo "unknown")
    info "Hyprland detected: $HYPR_VER"
    warn "This config requires Hyprland 0.55+ for Lua config support."
    warn "If your version is older, your Hyprland will ignore these configs."
else
    warn "Hyprland is not installed. Install it before using these configs."
fi

# Check for required apps
MISSING=""
for pkg in waybar rofi fastfetch fish; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        MISSING="$MISSING $pkg"
    fi
done

if [ -n "$MISSING" ]; then
    warn "Missing packages:$MISSING"
    warn "The config will still be copied, but those features won't work."
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] || { info "Aborted."; exit 0; }
fi

# ─── 2. Back up existing configs ───────────────────────────────────────
info "Backing up existing configs to $BACKUP"
mkdir -p "$BACKUP"

FOLDERS=(
    .config/hypr
    .config/waybar
    .config/fish
    .config/rofi
    .config/fastfetch
)

for f in "${FOLDERS[@]}"; do
    if [ -d "$HOME/$f" ]; then
        mkdir -p "$BACKUP/$(dirname "$f")"
        mv "$HOME/$f" "$BACKUP/$f"
        echo "   backed up: $f"
    fi
done

# ─── 3. Clone and copy ─────────────────────────────────────────────────
info "Cloning repository..."
TMP=$(mktemp -d)
git clone --depth 1 "$REPO" "$TMP" 2>&1 | grep -v "^Cloning" || {
    error "Failed to clone repo. Check your internet connection."
    exit 1
}

info "Copying configs into place..."
mkdir -p "$HOME/.config"
cp -r "$TMP/.config/." "$HOME/.config/"
rm -rf "$TMP"

# ─── 4. Done ───────────────────────────────────────────────────────────
info "Done!"
echo
echo "  Backups saved to: $BACKUP"
echo "  If anything breaks, restore with:"
echo "    rm -rf ~/.config/hypr ~/.config/waybar"
echo "    mv $BACKUP/.config/* ~/.config/"
echo
info "Log out and back in (or restart Hyprland) to apply."
