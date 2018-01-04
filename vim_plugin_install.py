# -*- coding: utf-8 -*-
# This would try to install the vim plugins saved in the 'vim_plugin_on_github'file

import sys, subprocess, os, os.path as path
from subprocess import call
import requests

# Check folder existance
home_folder = os.path.expanduser("~")
vim_folder = path.join(home_folder, "vimfiles")

bundle_folder = path.join(vim_folder, "bundle")
autoload_folder = path.join(vim_folder, "autoload")
pathogen_file = path.join(autoload_folder, "pathogen.vim")
color_folder = path.join(vim_folder, "color")
color_file = path.join(color_folder, "solarized.vim")
pathogen_url = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
solarized_url = "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim"
color_pathogen = {color_file: solarized_url,
		  pathogen_file: pathogen_url}
for i in [bundle_folder, autoload_folder, color_folder]:
    if not path.exists(i):
        os.makedirs(i)
for file_name, url in color_pathogen.items():
    with open(file_name, 'w') as f:
        f.write(requests.get(url).text)


with open("vim_plugin_on_github", 'r') as f:
    for line in f:
        line = line.strip()
        if not line.startswith('http'):
            continue
        plugin_base_url = path.basename(line)
        plugin_name = (path.splitext(plugin_base_url))[0]
        plugin_folder = path.join(bundle_folder, plugin_name)
        if path.exists(plugin_folder):
            continue
        
        if call(["git","clone", line, plugin_folder]):
            print("Error Occured. Message see above")
        else:
            print(plugin_name,"installed.")

print("Done :)")
