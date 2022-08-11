# color
export CLICOLOR=1
export TERM=xterm-256color
alias ls='ls -GFh'
#export="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export LSCOLORS=ExFxBxDxCxegedabagacad

# prompt
PROMPT='%F{blue}%n%f:%B%F{yellow}%~%f%b$ '

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

