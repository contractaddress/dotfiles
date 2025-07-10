# Prompt
#PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"
# Export PATH$
export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export OPENAI_API_KEY=NICE_TRY :P
export ANTHROPIC_API_KEY=NICE_TRY :P
export GTK_THEME=catppuccin-frappe-maroon-standard+default
export XCURSOR_THEME=Bibata-Modern-Classic
export XCURSOR_SIZE=24



function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

# alias
alias ls='ls --color=auto'
alias ll='ls -lha --color=auto'
alias grep='grep --color=auto'
alias ffzf='fzf --preview "nvim {}"'
alias pvenv='python3 -m venv .venv && source .venv/bin/activate'
alias docker_arch='sudo docker run -it --rm archlinux'
alias spotify='spotify --ozone-platform=wayland  --ui.track_notifications_enabled=false & disown; exit'

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]; then
  source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  # Select all suggestion instead of top on result only
  zstyle ':autocomplete:tab:*' insert-unambiguous yes
  zstyle ':autocomplete:tab:*' widget-style menu-select
  zstyle ':autocomplete:*' min-input 2
  bindkey $key[Up] up-line-or-history
  bindkey $key[Down] down-line-or-history
fi

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

function ranger {
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    
    # Run ranger and capture the current directory to the tempfile when quitting Ranger
    command ranger --cmd="map Q chain shell echo %d > $tempfile; quitall"
    
    # If tempfile exists, read the directory and change the current shell's directory
    if [[ -f "$tempfile" ]]; then
        local dir_to_cd=$(cat "$tempfile")
        if [[ "$dir_to_cd" != "$(pwd)" ]]; then
            cd "$dir_to_cd" || return
        fi
    fi
    
    # Clean up the temporary file
    command rm -f "$tempfile" 2>/dev/null
}

eval "$(starship init zsh)"

source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh
