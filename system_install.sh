#!/bin/bash

log () {
    echo "[system_install.sh] $1"
}

log "updating apt"
sudo apt-get update

log "installing brew"
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

log "installing build tools"
sudo apt-get install build-essential
brew install gcc

log "installing gitlab cli"
brew install glab

log "installing jq"
sudo apt-get install jq -y

log "installing zsh"
sudo apt-get install -y zsh

log "done"

