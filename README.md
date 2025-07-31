# DOTFILES

welcome to my Arch Hyprland dotfiles + tools made by me  

![themechanger](assets/themechanger.webp)
  
### specs

- **OS:** [Arch Linux](https://archlinux.org)
- **WM:** [Hyprland](https://hypr.land/)
- **Shell:** [Zsh](https://wiki.archlinux.org/index.php/Zsh)
- **Terminal:** [Kitty](https://wiki.archlinux.org/title/Kitty) & [Foot](https://wiki.archlinux.org/title/Foot)
- **Editor:** [Neovim (LazyVim)](https://www.lazyvim.org/)
- **Browser:** [Librewolf](https://librewolf.net/)
- **Theme management:** [swww (wallpaper)](https://github.com/LGFae/swww) / [hellwal (terminal colors)](https://github.com/danihek/hellwal)
- **Prompt customization:** [starship](https://starship.rs/) w/ [starchanger](starchanger/)
- **Image Gallery:** [swayimg](https://github.com/artemsen/swayimg)
- **GTK:** [gruvbox-gtk-theme-git](https://aur.archlinux.org/packages/gruvbox-gtk-theme-git)

## starchanger

simple TUI to change starship presets quickly system wide. Made in Python with the [textual](https://textual.textualize.io/) library  
*you can find the script [here](starchanger/)*

![starchanger](assets/starchangrr.gif)
  
## Starchanger Requirements

- [Starship](https://starship.rs)
- Textual library
- Pyinstaller (optional)

## recommendations

### Install script

```bash
chmod +x install.sh
```

```bash
./install.sh
```

find the executable ```dist/starchanger``` and add it to you PATH

### Manual Installation

create and activate a python venv

```bash
python3 -m venv .venv && source .venv/bin/activate
```

install requirements

```bash
pip install -r requirements.txt 
```

turn the script into an executable

```bash
pyinstaller --onefile --name starchanger main.py
```

find the executable ```dist/starchanger``` and add it to you PATH
