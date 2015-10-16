export NODE_PATH='/usr/local/lib/node_modules'

export NVM_DIR="$HOME/.nvm"
if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
  source $(brew --prefix nvm)/nvm.sh stable
fi
nvm use stable
