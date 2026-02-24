import subprocess
import os
from pathlib import Path
from textual import on
from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Select


themes_dir = Path(os.path.expanduser('~/.config/hellwal/themes/'))

themes = [file.name for file in themes_dir.iterdir()]
themes.sort()


class Hellman(App):

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
        self.title = 'HellMan'

    @on(Select.Changed)
    def select_changed(self, event: Select.Changed) -> None:
        self.selectedtheme = str(event.value)
        subprocess.run(f'hellwal -t {themes_dir}/{self.selectedtheme}', shell=True)

Hellman().run()

