autoload -U compinit
compinit

autoload -Uz colors
colors

export LANG=ja_JP.UTF-8

bindkey -e

HISTFILE=~/.zsh_history
HISTSIZE=2000000
SAVEHIST=2000000
setopt hist_ignore_all_dups
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

export LISTMAX=100000
setopt list_packed

setopt nolistbeep
setopt no_beep

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export EDITOR=vim

eval "$(rbenv init -)"

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# colors
PROMPT="%{$fg[green]%}%n@%m%{$reset_color%} %% "
RPROMPT="[%{$fg[yellow]%}%~%{$reset_color%}]"
setopt PROMPT_SUBST

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -p -G -w"
    ;;
  linux*)
    alias ls="ls --color"
    ;;
esac

# term
echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}


# alias
alias vim='/usr/local/bin/vim'
alias vi='vim'
alias vin='vim'

alias gs='git status'

alias bx='bundle exec'

alias ctags="`brew --prefix`/bin/ctags"
alias ctags-ruby-refresh='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'

if [ -f "${HOME}/Library/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/Library/google-cloud-sdk/path.zsh.inc"; fi

if [ -f "${HOME}/Library/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/Library/google-cloud-sdk/completion.zsh.inc"; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias magit='vim -c MagitOnly'
alias daily_reports='vim -c DailyReport'
alias gc='git checkout'
