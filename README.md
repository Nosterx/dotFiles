# Purpose
Manage dotfiles.

# Usage

1. Clone dotfiles

`cd ~ && git clone https://github.com/Nosterx/dotfiles.git`

2. Symlink dotfiles to your home folder

`python dotfiles/symlink_dotfiles.py` `--help` for details

3. Install Vum Bundle

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

4. Install Vim Plugins (run in vim)

`:PluginInstall`

5. Follow YouCompleteMe installation instructions https://github.com/Valloric/YouCompleteMe

For deb-based systems:
`sudo apt-get install build-essential cmake python-dev python3-dev && cd ~/.vim/bundle/YouCompleteMe && ./install.py`

6. Installation instructions from https://github.com/powerline/fonts in one line

`git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts`


# TODO
make one-step installation =)


# Originally from
https://github.com/flyfy1/dotFiles
