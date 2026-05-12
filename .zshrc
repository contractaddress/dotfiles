export PATH=~/.local/bin:~/.local/scripts/:snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/.bun/bin:~/.local/bin/:$PATH
export OPENAI_API_KEY=bleh
export ANTHROPIC_API_KEY=bleh
export MISTRAL_API_KEY=bleh
export KIMI_API_KEY=bleh
export OLLAMA_HOST=bleh
export OLLAMA_API_BASE=bleh
export CONTEXT7_API=bleh
export FIRECRAWL_API_KEY=bleh
export ZEN_API=bleh
export DEEPSEEK_API=bleh

export GITHUBTOKEN=forgor
export DISCWEBHK=forkepri
export TGtoken=forkepri
export ChatID=forkepri

export CSFLOAT_API_KEY=

# alias
alias ls='ls --color=auto'
alias ll='ls -lha --color=auto'
alias grep='grep --color=auto'
alias ffzf='fzf --preview "nvim {}"'
alias pvenv='python3 -m venv .venv && source .venv/bin/activate'
alias docker_arch='sudo docker run -it --rm archlinux'
#alias spotify='spotify --ozone-platform=wayland  --ui.track_notifications_enabled=false & disown; exit'
alias swi='swayimg'
alias gittoken='echo $GITHUBTOKEN | wl-copy'
alias hellman='$TERM -e --title "FloatingFoot" hellman'
alias screenshots='swi -gr ~/Pictures/Screenshots/'
alias wallpapers='swi -gr ~Pictures/Wallpapers/'
alias favorites='swi -gr ~/Pictures/Favorites/'
alias bb="bun run build && bun run preview"
alias brave="brave --password-store=basic & disown"
alias devbox='TERM=xterm-256color && ssh devbox'
alias ydlmusic='noglob yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "~/Music/playlistuh/%(title)s.%(ext)s"'

#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
#zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
#zinit snippet OMZL::git.zsh
#zinit snippet OMZP::git
#zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
#zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Shell integrations
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh

#pywal cache
#[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences

# bun completions
[ -s "/home/username/.bun/_bun" ] && source "/home/username/.bun/_bun"

# opencode
export PATH=/home/username/.opencode/bin:$PATH

