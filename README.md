# Niall's dot files

## Installation

`make all` should work on an ubuntu system. You might need other system
packages such as build-essential and python which I haven't bothered listing.

### Zsh plugins:

- Oh-My-ZSH [ https://github.com/robbyrussell/oh-my-zsh ] (Nice prompt & plugins for Zsh)
  + `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- scm_breeze [ https://github.com/ndbroadbent/scm_breeze ] (Great Git shortcuts for Zsh)
  + `git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze ; ~/.scm_breeze/install.sh`

### ViM plugins:

- Vundle [ https://github.com/VundleVim/Vundle.vim ] (ViM plugin manager)
- jedi-vim [ https://github.com/davidhalter/jedi-vim ] (Nice completion for Python)
- Syntastic [ https://github.com/scrooloose/syntastic ] (Run syntax checkers)
- Vim python pep 8 indent [ https://github.com/hynek/vim-python-pep8-indent ] (Good Python indentation)
- CtrlP [ https://github.com/kien/ctrlp.vim ] (Fuzzy file opener etc)
- vim-javascript [ https://github.com/pangloss/vim-javascript ] (Nice indentation & syntax for JavaScript)

### tmux config
- M-A modifier
- '-' to split horizontally
- '|' to split vertically
- M-<arrow> move panes
