

ZSH = /usr/bin/zsh
OH_MY_ZSH_URL = https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
OH_MY_ZSH = $(HOME)/.oh-my-zsh
SCM_BREEZE = $(HOME)/.scm_breeze
VIM = /usr/local/bin/vim

VIM_VERSION = 8.0.0045
VIM_TARBALL = $(HOME)/v$(VIM_VERSION).tar.gz
VIM_URL = https://github.com/vim/vim/archive/v$(VIM_VERSION).tar.gz
VIM_SRC = $(HOME)/vim-$(VIM_VERSION)/_stamp

VIM_RC = $(HOME)/.vimrc

VUNDLE_URL = https://github.com/VundleVim/Vundle.vim.git 
VUNDLE = $(HOME)/.vim/bundle/Vundle.vim/_stamp

TMUX = /usr/bin/tmux
TMUX_CONF = $(HOME)/.tmux.conf
.PHONY: all

$(ZSH):
	echo 'Installing ZSH and making default shell'
	sudo apt-get install -y zsh
	sudo chsh -s /usr/bin/zsh $(whoami)

$(OH_MY_ZSH): $(ZSH)
	echo 'Installing Oh-my-Zsh'
	sh -c "$$(curl -fsSL $(OH_MY_ZSH_URL))"

$(SCM_BREEZE): $(ZSH)
	echo 'Installing scm_breeze'
	git clone git://github.com/ndbroadbent/scm_breeze.git $(HOME)/.scm_breeze
	$(HOME)/.scm_breeze/install.sh

$(VIM_TARBALL):
	wget -O $(VIM_TARBALL) $(VIM_URL)

$(VIM_SRC): $(VIM_TARBALL)
	tar -C $(HOME) -xzf $(VIM_TARBALL)
	touch $(VIM_SRC)

$(VIM): $(VIM_SRC)
	(cd $$(dirname $(VIM_SRC)) && ./configure --prefix=/usr/local \
		 --enable-pythoninterp && make && sudo make install)

$(TMUX):
	echo 'Installing tmux'
	sudo apt-get install -y tmux

$(TMUX_CONF): $(TMUX)
	cp tmux/tmux.conf $(HOME)/.tmux.conf

$(VIM_RC):
	cp vim/vimrc $(HOME)/.vimrc

$(VUNDLE): $(VIM_RC)
	mkdir -p $(HOME)/.vim/bundle
	git clone $(VUNDLE_URL) $$(dirname $(VUNDLE))
	vim +BundleInstall +qall
	touch $(VUNDLE)

all: $(VIM) $(ZSH) $(OH_MY_ZSH) $(SCM_BREEZE) $(TMUX_CONF) $(VUNDLE)
