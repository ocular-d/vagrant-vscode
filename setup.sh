#!/bin/bash -eux

set -euo pipefail

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
#COL_RED=$ESC_SEQ"31;01m"
#COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"

# Functions
# Update
extensions() {
    echo
    echo -en "${COL_YELLOW} ==> Installing VSCode extensions ${COL_RESET}\n"
    code --install-extension pnp.polacode
    code --install-extension bierner.markdown-emoji
    code --install-extension AlanWalk.markdown-toc
    code --install-extension CoenraadS.bracket-pair-colorizer
    code --install-extension streetsidesoftware.code-spell-checker
    code --install-extension ms-vscode.wordcount
    code --install-extension ybaumes.highlight-trailing-white-spaces
    code --install-extension myh.preview-vscode
    code --install-extension mrmlnc.vscode-remark
    code --install-extension johnpapa.read-time
    code --install-extension vincaslt.highlight-matching-tag
    code --install-extension PKief.material-icon-theme
    code --install-extension Hyzeta.vscode-theme-github-light
    code --install-extension eamodio.gitlens
    code --install-extension drewbourne.vscode-remark-lint
    code --install-extension testthedocs.vale
    code --install-extension ocld.ocld-snippets
}

npm_modules() {
    npm install remark-cli remark-preset-lint-recommended
    npm install remark-preset-lint-consistent remark-validate-links
    npm install remark-preset-lint-markdown-style-guide
}

update_bashrc() {
    echo 'export PATH="$PATH:/home/vagrant/node_modules/.bin"' >> ~/.bashrc
}

update_vscode_settings() {
    wget https://gist.githubusercontent.com/ocular-d/cda72372a8168f0711700d417fa8a13e/raw/5f23d12b395dd62d271c02e5ee3af26a000c06c7/settings.json -O $HOME/.config/Code/User/settings.json
}

# Run functions
extensions
npm_modules
update_bashrc
update_vscode_settings
