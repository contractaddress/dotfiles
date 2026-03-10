import re
import subprocess
import os
from pathlib import Path
from textual import on
from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Label, Select


current_theme_file = Path(os.path.expanduser('~/.cache/hellwal/variables.sh'))
themes_dir = Path(os.path.expanduser('~/.config/hellwal/themes/'))

themes = [file.name for file in themes_dir.iterdir()]
themes.sort()


def get_current_theme():
    if not current_theme_file.exists():
        return None
    with current_theme_file.open('r') as f:
        contents = f.read()

    theme_line = re.search(r"^wallpaper=(.*)", contents, re.MULTILINE)

    if theme_line:
        full_path = theme_line.group(1).strip("'\"")
        return Path(full_path).name
    return None

current_theme=get_current_theme()

class Hellman(App):

    CSS="""
    Screen {
    layout: vertical;          
    align-horizontal: center;  
    align-vertical: middle;
    }
    #current_theme_label {
    margin-left: 10;
    margin-bottom: 1;
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
        yield Label(f'Current theme: {current_theme}', id='current_theme_label')
        yield Select.from_values(themes, id='box')

    def on_mount(self) -> None:
        self.theme = 'tokyo-night'
        self.title = 'HellMan'

    @on(Select.Changed)
    def select_changed(self, event: Select.Changed) -> None:
        self.selectedtheme = str(event.value)
        subprocess.run(f'hellwal -t {themes_dir}/{self.selectedtheme}', shell=True)
        current_theme = get_current_theme()
        self.query_one('#current_theme_label', Label).update(f'Current theme: {current_theme}')

Hellman().run()
