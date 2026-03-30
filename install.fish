#!/usr/bin/env fish

# Usage: install.fish [module...]
# Modules: config
# Default: installs all modules

function module_fish
  echo "[Install] FISH"
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  omf install lavender && omf theme lavender
  fisher update
end

function module_doom
  git clone https://github.com/domtronn/all-the-icons.el
  sudo cp all-the-icons.el/fonts/*.ttf $HOME/Library/Fonts/
  rm -rf all-the-icons.el
end

<<<<<<< HEAD
function module_ghostty
    install_config ghostty ./ghostty/ "$HOME/Library/Application Support/com.mitchellh.ghostty/"
end

function module_packages
    fish packages.fish
    brew install tmux
end

set -l all_modules nvim fish kitty doom ghostty packages
set -l modules $argv

if test (count $modules) -eq 0
  echo "Installing all modules"
  set modules $all_modules
end 

for m in $modules
    if contains $m $all_modules
        module_$m
    else
        echo "Unknown module: $m (available: $all_modules)"
        exit 1
    end
=======
function module_packagesq
  brew update
  brew install stow
  brew install --cask ghostty
  brew install tmux

  # DOOM EMACS lsps
  pip install 'python-lsp-server[all]'
>>>>>>> e87a0bd (Migrate dotfiles to use stow)
end
