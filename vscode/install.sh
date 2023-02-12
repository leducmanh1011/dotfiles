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
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done