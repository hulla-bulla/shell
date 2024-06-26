#!/bin/bash

log () {
    echo "[install.sh] $1"
}

log "updating apt"
sudo apt-get update

log "adding blom_profile to .bashrc"
grep -qxF "source $(pwd)/blom_profile" ~/.bashrc || echo "source $(pwd)/blom_profile" >> ~/.bashrc

log "adding .secrets to .bashrc"
grep -qxF "source ~/.secrets" ~/.bashrc || echo "source ~/.secrets" >> ~/.bashrc
chmod 600 ~/.secrets


[ -f ~/.secrets ] || (cp template.secrets ~/.secrets && log "created empty ~/.secrets file")

log "installing python requirements"
pip install -r requirements.txt

log "installing"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

log "post installation steps"
grep -qxF 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' ~/.bashrc  || (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
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

log "installing zimfw"
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

log "sourcing .bashrc"
source ~/.bashrc

log "done"

