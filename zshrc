# HOMEBREW M1 @ https://github.com/Homebrew/discussions/discussions/446
eval "$(/opt/homebrew/bin/brew shellenv)"

# INIT PREZTO
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ENV VARIABLES
export GPG_TTY=$(tty)
export PATH=~/.asdf/shims:$PATH
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# ALIASES 
alias dc="docker-compose"
alias kc="kubectl"
# alias pod='arch -x86_64 pod'

# # SETUP
# eval "$(fnm env --use-on-cd)"

# fnm
export PATH=/Users/czysty/.fnm:$PATH
eval "`fnm env`"
