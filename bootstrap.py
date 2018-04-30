import shutil as util

from pathlib import Path
home = str(Path.home())
print(home)
util.copy(home + '/.dotfiles/shell/linux-tmux.conf', home + '/.tmux.conf')

