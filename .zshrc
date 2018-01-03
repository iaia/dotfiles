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

# PROMPT {{{

# vcs_infoロード
autoload -Uz vcs_info

# vcsの表示
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# プロンプト表示直前にvcs_info呼び出し
precmd () {
 psvar=()
 LANG=en_US.UTF-8 vcs_info
 [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# プロンプト表示
PROMPT="%{$fg[green]%} ✗%{$reset_color%} "
RPROMPT="%1(v|%F{green}%1v%f|) [%{$fg[yellow]%}%~%{$reset_color%}]"

setopt prompt_subst

# }}}

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
alias v='vim'

alias g='git'
alias gs='git status'
alias gc='git checkout'
alias git-branch-delete="git branch --merged master | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"

alias bx='bundle exec'
alias br='bin/rails'

alias ctags="`brew --prefix`/bin/ctags"
alias ctags-ruby-refresh='ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .'

if [ -f "${HOME}/Library/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/Library/google-cloud-sdk/path.zsh.inc"; fi

if [ -f "${HOME}/Library/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/Library/google-cloud-sdk/completion.zsh.inc"; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias magit='vim -c MagitOnly'
alias daily_reports='vim -c DailyReport'

