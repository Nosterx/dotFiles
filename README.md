# Purpose
Manage dotfiles.

# Usage
1. Go Home
`cd ~`

2. Clone dotfiles
`git clone https://github.com/Nosterx/dotfiles.git`

3. Symlink dotfiles to your home folder
`python symlink_dotfiles.py` `--help` for details

4. Install Vum Bundle
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

5. Install Vim Plugins (run in vim)
`:PluginInstall`

6. Follow YouCompleteMe installation instructions https://github.com/Valloric/YouCompleteMe
For deb-based systems:
`sudo apt-get install build-essential cmake python-dev python3-dev && cd ~/.vim/bundle/YouCompleteMe && ./install.py`

7. Installation instructions from https://github.com/powerline/fonts in one line
`git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts`


# Foot Notes on vim key mappings
This section is irrelevant to the propuse of this repo.. but just some interesting points to take note

1. If one wants to use mapping `<c-?>`, note that ? can only be letters
2. And additionally, the combination below better not used:

        <c-m> -- means <enter>
        <c-i> -- means <tab>
        <c-s> -- means suspend, in most terminals

3. Better be careful that, do not conflict with the tmux's prefix-key

# TODO
make one-step installation =)


# Originally from
https://github.com/flyfy1/dotFiles
