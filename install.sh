#!/bin/zsh
DOTFILES_HOME=${HOME}/.dotfiles.git
LILYTERM_HOME=${HOME}/.config/lilyterm
VIM_HOME=${HOME}/.vim
VIM_BUNDLE_HOME=${HOME}/.vim/bundle/Vundle.vim
DIR_COLORS=${HOME}/.dircolors
FONT_DIR=${HOME}/.fonts
FONT_CONFIG_DIR=${HOME}/.config/fontconfig

mkdir -p ${LILYTERM_HOME}
rm -rf ${LILYTERM_HOME}/default.conf
ln -s ${DOTFILES_HOME}/lilyterm.conf ${LILYTERM_HOME}/default.conf

echo 'Installing zsh config....'
if [[ ! -f ${HOME}/.zshrc ]]; then
    ln -s ${DOTFILES_HOME}/zshconfig/zshrc ${HOME}/.zshrc
    source ~/.zshrc
else
    echo "zsh init failed because ~/.zshrc is exists, delete it first!!!"
    exit -1
fi

echo 'Installing powerline....'
if [[ -f ${DIR_COLORS} ]]; then
    mv ${DIR_COLORS} ${DIR_COLORS}.old
fi

cp ${DOTFILES_HOME}/dircolors-solarized/dircolors.256dark ${DIR_COLORS}
${DOTFILES_HOME}/fonts/install.sh

mkdir -p ${FONT_DIR}
mkdir -p ${FONT_CONFIG_DIR}
cp ${DOTFILES_HOME}/Powerline*.otf ${FONT_DIR}
cp ${DOTFILES_HOME}/10-powerline-symbols.conf ${FONT_CONFIG_DIR}/fonts/fonts.conf

echo 'Installing vim config....'
if [[ ! -f ${HOME}/.vimrc ]]; then
    if [[ ! -d ${VIM_BUNDLE_HOME} ]]; then
        git clone https://github.com/gmarik/vundle.git ${VIM_BUNDLE_HOME}
    fi

    rm -rf ${HOME}/.vimrc
    ln -s ${DOTFILES_HOME}/vimconfig/vimrc ${HOME}/.vimrc
    viminstall
    mkdir -p ${VIM_HOME}/colors
    cp ${VIM_BUNDLE_HOME}/vim-colors-solarized/colors/solarized.vim ${VIM_HOME}/colors
else
    echo "vim init failed because ~/.vimrc is exists, delete it first!!!"
    exit -1
fi

echo 'Installing git config....'
ln -s ${DOTFILES_HOME}/gitconfig ${HOME}/.gitconfig

echo 'Installing input config....'
ln -s ${DOTFILES_HOME}/inputrc ${HOME}/.inputrc
