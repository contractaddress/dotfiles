# Greeting

# Prompt
#PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"
# Export PATH$
export PATH=~/.local/bin:~/.local/scripts/:snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/.bun/bin:~/.local/bin/:$PATH
export OPENAI_API_KEY=bleh
export ANTHROPIC_API_KEY=bleh
export MISTRAL_API_KEY=bleh
export GITHUBTOKEN=forgor
export DISCWEBHK=forkepri
export TGtoken=forkepri
export ChatID=forkepri


# alias
alias ls='ls --color=auto'
alias ll='ls -lha --color=auto'
alias grep='grep --color=auto'
alias ffzf='fzf --preview "nvim {}"'
alias pvenv='python3 -m venv .venv && source .venv/bin/activate'
alias docker_arch='sudo docker run -it --rm archlinux'
alias spotify='spotify --ozone-platform=wayland  --ui.track_notifications_enabled=false & disown; exit'
alias swi='swayimg'
alias gittoken='echo $GITHUBTOKEN | wl-copy'
alias hellman='$TERM -e --title "FloatingFoot" hellman'
alias screenshots='swi -gr ~/Pictures/Screenshots/'
alias wallpapers='swi -gr ~Pictures/wallpapers/'


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

export PATH=$PATH:/home/pingu/.spicetify

# bun completions
[ -s "/home/pingu/.bun/_bun" ] && source "/home/pingu/.bun/_bun"

