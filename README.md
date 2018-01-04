# Purpose
Manage dotfiles.

# Usage
1. `$ git clone https://github.com/Nosterx/dotfiles.git`

2. `$ python symlink_dotfiles.py`

3. `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

4. `:PluginInstall`

5. Follow YouCompleteMe installation instructions https://github.com/Valloric/YouCompleteMe

6. For each of the config file that want to manage using git, you can run 
  `python moveDotFileInHomeAndCreateSymoblicLink.py FILE_PATH` 
   (if only a simple file name is given, the filepath would be defaulted to 
   the home folder)
   It will move the file into the config file forder, and put an symbolic link
   in its origin place. 

# Foot Notes on vim key mappings
This section is irrelevant to the propuse of this repo.. but just some interesting points to take note

1. If one wants to use mapping `<c-?>`, note that ? can only be letters
2. And additionally, the combination below better not used:

        <c-m> -- means <enter>
        <c-i> -- means <tab>
        <c-s> -- means suspend, in most terminals

3. Better be careful that, do not conflict with the tmux's prefix-key

# TODO
- Currently the user need to handle the .bashrc file themselves (by sourcing this file in their .bashrc).
  Consider using script to auto-add the sourcing part, and don't add if it already exists in the `.bashrc`
  folder.

# Originally from
https://github.com/flyfy1/dotFiles
