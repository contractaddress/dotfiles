import os
import subprocess
from pathlib import Path
from textual import on
from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Select
from time import sleep

def check_terminal():
    terminal = subprocess.run('echo $TERM', shell=True, capture_output=True, text=True)
    terminal = terminal.stdout.strip()
    if terminal != 'xterm-kitty':
        print('Not currently running kitty, starting script anyways.')
        sleep(1.5)
    else:
        pass

    return terminal

terminal = check_terminal()

themes_dir = Path(os.path.expanduser('~/.config/kitty/kitty-themes/themes/'))
if themes_dir.exists():
    themes = [file.name for file in themes_dir.iterdir()]
    themes.sort()
else:
    print('Kitty-themes dir not found! create one or install kitty-themes by dexpota.')
    exit()

class KittyThemes(App):

    CSS="""
    Screen {
    layout: vertical;          
    align-horizontal: center;  
    align-vertical: middle;
    }
    #box {
    width: 60%;
    height: 70%;
    }
    #box > SelectOverlay {
    max-height: 100%;
    }
    """

    def compose(self) -> ComposeResult:
        yield Header(show_clock=True, icon='🖼️')
        yield Footer()
        yield Select.from_values(themes, id='box')

    def on_mount(self) -> None:
        self.theme = 'tokyo-night'
        self.title = 'KittyThemes'

    @on(Select.Changed)
    def select_changed(self, event: Select.Changed) -> None:
        self.selectedtheme = str(event.value)

        themeconfsymlink_path = os.path.expanduser('~/.config/kitty/theme.conf')
        if os.path.islink(themeconfsymlink_path): #Removing previous theme.conf file 
            print(f"Removing existing symlink: {themeconfsymlink_path}")
            os.remove(themeconfsymlink_path) 
        else:
            pass

        subprocess.run(f'ln -s {themes_dir}/{self.selectedtheme} ~/.config/kitty/theme.conf', shell=True) #changing the theme
        if terminal == 'xterm-kitty':
            subprocess.run(f'kitty @ set-colors -a {themes_dir}/{self.selectedtheme}', shell=True, check=True) #applying a preview of the therme to the current terminal = no need to restart to apply
        else:
            pass

        self.exit()

KittyThemes().run()


