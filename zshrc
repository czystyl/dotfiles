# HOMEBREW M1 @ https://github.com/Homebrew/discussions/discussions/446
eval "$(/opt/homebrew/bin/brew shellenv)"

# INIT PREZTO
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ENV VARIABLES
export GPG_TTY=$(tty)
export PATH=~/.asdf/shims:$PATH

# ALIASES 
alias dc="docker-compose"

# SETUP
eval "$(fnm env --use-on-cd)"
