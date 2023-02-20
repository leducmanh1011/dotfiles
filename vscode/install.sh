#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
eamodio.gitlens
CraigMaslowski.erb
PKief.material-icon-theme
gerane.Theme-Monokai
cweijan.vscode-office
dsznajder.es7-react-js-snippets
skyran.js-jsx-snippets
dunstontc.viml
gencay.vscode-chatgpt
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done
