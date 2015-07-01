#!/bin/zsh
DOTFILES_HOME=${HOME}/.dotfiles.git
LILYTERM_HOME=${HOME}/.config/lilyterm
VIM_BUNDLE_HOME=${HOME}/.vim/bundle/Vundle.vim

mkdir -p ${LILYTERM_HOME}
rm -rf ${LILYTERM_HOME}/default.conf
ln -s ${DOTFILES_HOME}/lilyterm.conf ${LILYTERM_HOME}/default.conf

if [[ ! -f ${HOME}/.zshrc ]]; then
    ln -s ${DOTFILES_HOME}/zshconfig/zshrc ${HOME}/.zshrc
    source ~/.zshrc
else
    echo "zsh init failed because ~/.zshrc is exists, delete it first!!!"
fi

if [[ ! -f ${HOME}/.vimrc ]]; then
    if [[ ! -d ${VIM_BUNDLE_HOME} ]]; then
        git clone https://github.com/gmarik/vundle.git ${VIM_BUNDLE_HOME}
    fi

    rm -rf ${HOME}/.vimrc
    ln -s ${DOTFILES_HOME}/vimconfig/vimrc ${HOME}/.vimrc
    viminstall
else
    echo "vim init failed because ~/.vimrc is exists, delete it first!!!"
fi

