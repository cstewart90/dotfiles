lazy_source () {
    eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

# lazy load zgen
lazy_source zgen ${HOME}/.zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
    # load oh-my-zsh
    zgen oh-my-zsh

    # load oh-my-zsh plugins
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/pyenv
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/rbenv
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/gem
    zgen load cstewart90/dotfiles oh-my-zsh/custom/plugins/rails
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/sprunge
    zgen oh-my-zsh plugins/web-search

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load cstewart90/dotfiles oh-my-zsh/custom/themes/kanzo2

    # save all to init script
    zgen save
fi

export EDITOR=ne
export GOPATH="$HOME/Code/go"
export PATH="$GOPATH/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Tmux aliases
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

alias st="subl3"
alias reflector-get-mirrors="sudo reflector --verbose -l 100 -p http --sort rate --save /etc/pacman.d/mirrorlist"
alias fix-steam='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'
alias fix-steam-again='find ~/.local/share/Steam/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'