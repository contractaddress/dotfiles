## kittythemes Requirements

- [kitty-themes](https://github.com/dexpota/kitty-themes)
- Textual library (in requirements.txt)
- Pyinstaller (in requirements.txt)

**Note: kitty-themes is not mandatory, but it will create the necessary directories for the script to work, and it also provides many pre-made themes to choose from.**

## Manual Installation

**change directories**

```bash
cd dotfiles/mytools/kittythemes
```

**create and activate a python venv**

```bash
python3 -m venv .venv && source .venv/bin/activate
```

**install requirements (kitty-themes excluded)**

```bash
pip install -r requirements.txt 
```

**turn the script into an executable (recommended)**

```bash
pyinstaller --onefile --name kittythemes main.py
```

find the executable ```dist/kittythemes``` and add it to you PATH
