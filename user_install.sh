#!/bin/bash

log () {
    echo "[user_install.sh] $1"
}

log "adding blom_profile to .bashrc"
grep -qxF "source $(pwd)/blom_profile" ~/.bashrc || echo "source $(pwd)/blom_profile" >> ~/.bashrc

log "adding .secrets to .bashrc"
grep -qxF "source ~/.secrets" ~/.bashrc || echo "source ~/.secrets" >> ~/.bashrc
chmod 600 ~/.secrets

[ -f ~/.secrets ] || (touch ~/.secrets && log "created empty ~/.secrets file")

log "installing python requirements"
pip install -r requirements.txt

log "brew post installation steps"
grep -qxF 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' ~/.bashrc  || (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc

log "setting default shell to zsh"
chsh -s /usr/bin/zsh

log "installing zimfw"
echo "please run the following to install zimfw:"
echo "curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh"
echo

echo "adding skip_global_compinit to ~/.zshrc"
echo "skip_global_compinit=1" >> "$HOME/.zshrc"

log "sourcing .bashrc"
source ~/.bashrc

log "done"
