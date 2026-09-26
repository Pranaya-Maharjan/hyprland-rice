# 🌸 hyprland-rice

My Hyprland dotfiles 

 First time creating dotfiles — may be buggy. Feedback welcome!

## Preview

<img width="1920" height="1080" alt="screenshot-2026-09-27_00-37-45" src="https://github.com/user-attachments/assets/f2c0dcdd-a515-45f0-9fa1-187d4dc07811" />
##Full desktop

<img width="1920" height="1080" alt="screenshot-2026-09-27_00-37-49" src="https://github.com/user-attachments/assets/3161bb4a-bb0c-4480-a8e3-c07884b990e3" />
## Rofi powermenu

<img width="1920" height="1080" alt="screenshot-2026-09-27_00-41-05" src="https://github.com/user-attachments/assets/db717307-4b06-472b-b6f3-6798633453cc" />
## Rofi drun

<img width="1920" height="1080" alt="screenshot-2026-09-27_00-38-07" src="https://github.com/user-attachments/assets/84b9623b-1e13-4671-8175-11f46db42b4a" />
## Fastfetch + Terminal


## What's included

- **Hyprland** (Lua config — requires Hyprland 0.55+)
- **Waybar** — top bar with custom modules
- **Rofi** — power menu, app launcher, and runner 
- **Fastfetch** — system info with custom logo
- **Fish** — shell config with aliases
- **Hyprpaper** — wallpaper config

## Requirements

### Core
- Hyprland 0.55+ (Lua config support)
- Waybar
- Rofi
- Fastfetch
- Hyprpaper
- Fish shell

### Fonts & Themes
- A Nerd Font (e.g., JetBrainsMono Nerd Font)
- Moga-Light-Blue cursor theme *(optional — falls back to default if missing)*

### Optional (referenced by keybinds, not required)
- kitty (or any terminal)
- zen-browser
- ranger

## Installation

```bash
# Clone as a bare repo
git clone --bare https://github.com/Pranaya-Maharjan/hyprland-rice.git $HOME/.dotfiles

# Set up the alias
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.config/fish/config.fish

# Checkout the files
dot checkout

# Hide untracked files
dot config --local status.showUntrackedFiles no
