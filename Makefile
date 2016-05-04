

ZSH = /usr/bin/zsh
OH_MY_ZSH = $(HOME)/.oh-my-zsh
SCM_BREEZE = $(HOME)/.scm_breeze
VIM = /usr/local/bin/vim

VIM_VERSION = 7.4.1817
VIM_TARBALL = $(HOME)/v$(VIM_VERSION).tar.gz
VIM_URL = https://github.com/vim/vim/archive/v$(VIM_VERSION).tar.gz
VIM_SRC = $(HOME)/vim-$(VIM_VERSION)/

TMUX = /usr/bin/tmux
TMUX_CONF = $(HOME)/.tmux.conf

.PHONY: all

$(ZSH):
	echo 'Installing ZSH'
	sudo apt-get install -y zsh

$(OH_MY_ZSH): $(ZSH)
	echo 'Installing Oh-my-Zsh'
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

$(SCM_BREEZE): $(ZSH)
	echo 'Installing scm_breeze'
	git clone git://github.com/ndbroadbent/scm_breeze.git $(HOME)/.scm_breeze
	$(HOME)/.scm_breeze/install.sh

$(VIM_TARBALL):
	wget -O $(VIM_TARBALL) $(VIM_URL)

$(VIM_SRC): $(VIM_TARBALL)
	tar -C $(HOME) -xzf $(VIM_TARBALL)

$(VIM): $(VIM_SRC)
	(cd $(VIM_SRC) && ./configure --prefix=/usr/local --enable-pythoninterp && make && sudo make install)

$(TMUX):
	echo 'Installing tmux'
	sudo apt-get install -y tmux

$(TMUX_CONF): $(TMUX)
	cp tmux/tmux.conf $(HOME)/.tmux.conf
		
all: $(VIM) $(ZSH) $(OH_MY_ZSH) $(SCM_BREEZE) $(TMUX_CONF)
