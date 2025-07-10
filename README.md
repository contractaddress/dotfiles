# DOTFILES
welcome to my Arch Hyprland dotfiles + tools made by me  

![themechanger](assets/themechanger.webp)
  
### specs:

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
  
### Requirements:
- [Starship](https://starship.rs)
- Textual 
```
pip3 install textual
```  
in a python venv inside the script directory  
### recommendations:  
```
pip3 install pyinstaller
```
```
pyinstaller --onefile main.py
```
find the executable in ```dist/``` rename it  to **starchanger** and add it to your PATH
