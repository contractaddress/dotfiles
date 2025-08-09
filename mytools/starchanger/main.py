import subprocess
from textual import on
from textual.app import App, ComposeResult
from textual.widgets import Header, Footer, Select


STARSHIP_PRESETS = """bracketed-segments
gruvbox-rainbow
jetpack
nerd-font-symbols
no-empty-icons
no-nerd-font
no-runtime-versions
pastel-powerline
plain-text-symbols
pure-preset
tokyo-night""".splitlines()

class StarChanger(App):

    CSS="""
    Screen {
    layout: vertical;          
    align-horizontal: center;  
    align-vertical: middle;
    }
    #selectbox {
    width: 60%;
    height: 70%;
    }
    """

    def compose(self) -> ComposeResult:
        yield Header(show_clock=True, icon='🚀')
        yield Footer()
        yield Select.from_values(STARSHIP_PRESETS, id='selectbox')

    def on_mount(self) -> None:
        self.theme = 'gruvbox'
        self.title = 'STARCHANGER'

    @on(Select.Changed)
    def select_changed(self, event: Select.Changed) -> None:
        self.preset = str(event.value)
        subprocess.run(f"starship preset {self.preset} -o ~/.config/starship.toml", shell=True)
        self.exit()

StarChanger().run()

