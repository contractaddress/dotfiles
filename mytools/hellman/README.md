## hellman Requirements

- [Hellwal](https://github.com/danihek/hellwal)
- Textual library
- Pyinstaller (optional)

## Install script

**change directories**

```bash
cd dotfiles/mytools/hellman
```

**make the script executable and run it**

```bash
chmod +x install.sh
```

```bash
./install.sh
```

find the executable ```dist/hellman``` and add it to you PATH

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

find the executable ```dist/hellman``` and add it to you PATH
