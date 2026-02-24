## hellman Requirements

- [Hellwal](https://github.com/danihek/hellwal)
- Textual library
- Pyinstaller (optional)

## Manual Installation

**change directories**

```bash
cd dotfiles/mytools/hellman
```

**create and activate a python venv**

```bash
python3 -m venv .venv && source .venv/bin/activate
```

**install requirements (hellwal excluded)**

```bash
pip install -r requirements.txt 
```

**turn the script into an executable (recommended)**

```bash
pyinstaller --onefile --name hellman hellman.py
```

```bash
chmod +x dist/hellman
```

find the executable ```dist/hellman``` and add it to $PATH

## Quality of life

add this variable to your shell config

```bash
alias hellman="$TERM -e hellman"
```
