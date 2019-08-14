#!/bin/zsh

setopt EXTENDED_GLOB

DIR="${ZDOTDIR:-$HOME}"/.zprezto

if test -d "$DIR"; then
    cd $DIR
    
    git pull
    git submodule update --init --recursive
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    # do not sync .zshrc 
    if [ $rcfile:t != "zshrc" ]; then
      # use --force
      ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"      
    fi
  done
fi

