## Starchanger Requirements

- [Starship](https://starship.rs)
- Textual library
- Pyinstaller (optional)

## Install script

**change directories**

```bash
cd dotfiles/mytools/starchanger
```

**make the install script executable and run it**

```bash
chmod +x install.sh
```

```bash
./install.sh
```

find the executable ```dist/starchanger``` and add it to you PATH

## Manual Installation

**change directories**

```bash
cd dotfiles/mytools/starchanger
```

**create and activate a python venv**

```bash
python3 -m venv .venv && source .venv/bin/activate
```

**install requirements (starship excluded)**

```bash
pip install -r requirements.txt 
```

**turn the script into an executable (recommended)**

```bash
pyinstaller --onefile --name starchanger main.py
```

find the executable ```dist/starchanger``` and add it to you PATH
