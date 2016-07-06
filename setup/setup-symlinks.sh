#! /bin/bash

# Symlink ~/.vimrc to .config/vim/vimrc
ln ./vim/vimrc ~/.vimrc

# Add sourcing of .config/bash/config to default ~/.bashrc
echo -e '\n# Source .config/bash/config for user-specific settings\nif [ -f ~/.config/bash/config ]; then\n    source ~/.config/bash/config\nfi' >> ~/.bashrc
