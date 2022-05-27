# MIT License

# Copyright (c) 2021 Peter Mancuso

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from urllib.request import urlretrieve
from urllib.error import URLError
from zipfile import ZipFile
import os
import subprocess
import sys
import utility

FLAGS = os.O_CREAT | os.O_EXCL | os.O_WRONLY
VIM_DIRECTORY = ".vim"
VIM_FILES = [".vimrc", VIM_DIRECTORY + "/vimrc"]
VIM_SUB_DIRS = [VIM_DIRECTORY, (VIM_DIRECTORY + "/plugged"),
                (VIM_DIRECTORY + "/autoload"),
                (VIM_DIRECTORY + "/colors"),
                (VIM_DIRECTORY + "/undo")]
VIM_PLUG = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
VIMRC = "https://raw.githubusercontent.com/mancuso/dotfiles/master/vim/vimrc-vanila"
ZSH_INSTALL_URL = "https://raw.githubusercontent.com/robbyrussell/" \
                  "oh-my-zsh/master/tools/install.sh"
OS_DEPENDENCIES =['zsh', 'git', 'gcc', 'make']


def dependency_check():

    for binary in OS_DEPENDENCIES:
        if not utility.which(binary):
            print('Install '+ binary + ' before running script')
            sys.exit()


def oh_my_zsh_install():

    print("Downloading ohmysh")

    try:
        urlretrieve(ZSH_INSTALL_URL, os.path.expanduser('~/' + 'install.sh'))
    except URLError as e:
        if hasattr(e, 'reason'):
            print('Script failed to reach a server.')
            print('Reason: ', e.reason)
        elif hasattr(e, 'code'):
            print('The server couldn\'t fulfill the request.')
            print('Error code: ', e.code)
    else:
        print("Downloaded ohmyzsh")

    print("Running ohmysh Install Script")

    try:
        os.system('sh ~/install.sh')
    except OSError as e:
        print('Error code: {}'.format(e.errno))
        print('Error message: {}'.format(e.strerror))
    else:
        print("Finished Running Install Script")
    

def vim_install():

    print("Creating Vim directories")

    for sub in VIM_SUB_DIRS:
        try:
            os.mkdir(os.path.expanduser('~/' + sub))

        except OSError as e:
            print('Error code: {}'.format(e.errno))
            print('Error message: {}'.format(e.strerror))
        else:
            print("mkdir " + os.path.expanduser('~/' + sub))

    print("Creating Vim config file symbolic link")

    try:
        os.symlink(os.path.expanduser('~/') + VIM_FILES[1], os.path.expanduser('~/') + VIM_FILES[0])
    except OSError:
        print("Failed to make symbolic link.")
        print("ln -s " + os.path.expanduser('~/') + VIM_FILES[0]
              + " "" -> " + os.path.expanduser('~/') + VIM_FILES[1])
    else:
        print("ln -s " + os.path.expanduser('~/') + VIM_FILES[0]
              + " -> " + os.path.expanduser('~/') + VIM_FILES[1])

    print("Downloading Vim configuration file")

    try:
        urlretrieve(VIMRC, os.path.expanduser('~/' + '.vimrc'))
    except URLError as e:
        if hasattr(e, 'reason'):
            print('Script failed to reach a server.')
            print('Reason: ', e.reason)
        elif hasattr(e, 'code'):
            print('The server couldn\'t fulfill the request.')
            print('Error code: ', e.code)
    else:
        print("Vim Configuration File Written")

    print("Attempting download of Vim-Plug")

    try:
        urlretrieve(VIM_PLUG, os.path.expanduser('~/' + VIM_DIRECTORY + "/autoload/plug.vim"))

    except URLError as e:
        if hasattr(e, 'reason'):
            print('Script failed to reach a server.')
            print('Reason: ', e.reason)
        elif hasattr(e, 'code'):
            print('The server couldn\'t fulfill the request.')
            print('Error code: ', e.code)
    else:
        print("Downloaded Vim-Plug")
        print("Run: PlugInstall inside vim")


dependency_check()
vim_install()
oh_my_zsh_install()
