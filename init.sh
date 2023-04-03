#!/bin/bash
# for ubuntu server 

# installed
# vim, python tmux curl wget net-tools 
# golang
# web apache, nginx

# frameworks: 
# antigen, oh my zsh, oh my tmux, vimrc

# config
# fuzzy finder 

# check current user
sudo apt update
sudo apt-get install -y zsh vim tmux curl wget net-tools git htop
sudo apt-get install -y awk perl sed

sudo apt-get install -y python3-dev python3-pip python3-setuptools

sudo apt-get install -y fzf fd-find ripgrep bat tldr

# pip3 install thefuck --user

chsh -s $(which zsh)
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

export PATH="$PATH:$HOME/.local/bin"

# fzf ctrl-r and alt-c behavior
export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

zsh -c 'setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done'

mv $HOME/.zpreztorc $HOME/.zpreztorc.bak

echo "#
# Sets Prezto options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# General
#

# Set case-sensitivity for completion, history lookup, etc.
# zstyle ':prezto:*:*' case-sensitive 'yes'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Add additional directories to load prezto modules from
# zstyle ':prezto:load' pmodule-dirs $HOME/.zprezto-contrib

# Allow module overrides when pmodule-dirs causes module name collisions
# zstyle ':prezto:load' pmodule-allow-overrides 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':prezto:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':prezto:load' zfunction 'zargs' 'zmv'

# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'syntax-highlighting' \
  'completion' \
  'history-substring-search' \
  'autosuggestions' \
  'prompt'

#
# Autosuggestions
#

# Set the query found color.
# zstyle ':prezto:module:autosuggestions:color' found ''

#
# Completions
#

# Set the entries to ignore in static '/etc/hosts' for host completion.
# zstyle ':prezto:module:completion:*:hosts' etc-host-ignores \
#   '0.0.0.0' '127.0.0.1'

#
# Editor
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':prezto:module:editor' key-bindings 'vi'

# Auto convert .... to ../..
# zstyle ':prezto:module:editor' dot-expansion 'yes'

# Allow the zsh prompt context to be shown.
#zstyle ':prezto:module:editor' ps-context 'yes'

#
# Git
#

# Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
# zstyle ':prezto:module:git:status:ignore' submodules 'all'

#
# GNU Utility
#

# Set the command prefix on non-GNU systems.
# zstyle ':prezto:module:gnu-utility' prefix 'g'

#
# History
#

# Set the file to save the history in when an interactive shell exits.
# zstyle ':prezto:module:history' histfile "${ZDOTDIR:-$HOME}/.zsh_history"

# Set the maximum  number  of  events  stored  in  the  internal history list.
# zstyle ':prezto:module:history' histsize 10000

# Set the maximum number of history events to save in the history file.
# zstyle ':prezto:module:history' savehist 10000

#
# History Substring Search
#

# Set the query found color.
# zstyle ':prezto:module:history-substring-search:color' found ''

# Set the query not found color.
# zstyle ':prezto:module:history-substring-search:color' not-found ''

# Set the search globbing flags.
# zstyle ':prezto:module:history-substring-search' globbing-flags ''

#
# macOS
#

# Set the keyword used by `mand` to open man pages in Dash.app
# zstyle ':prezto:module:osx:man' dash-keyword 'manpages'

#
# Pacman
#

# Set the Pacman frontend.
# zstyle ':prezto:module:pacman' frontend 'yaourt'

#
# Prompt
#

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'sorin'

# Set the working directory prompt display length.
# By default, it is set to 'short'. Set it to 'long' (without '~' expansion)
# for longer or 'full' (with '~' expansion) for even longer prompt display.
# zstyle ':prezto:module:prompt' pwd-length 'short'

# Set the prompt to display the return code along with an indicator for non-zero
# return codes. This is not supported by all prompts.
# zstyle ':prezto:module:prompt' show-return-val 'yes'

#
# Python
#

# Auto switch the Python virtualenv on directory change.
# zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'

# Automatically initialize virtualenvwrapper if pre-requisites are met.
# zstyle ':prezto:module:python:virtualenv' initialize 'yes'

#
# Ruby
#

# Auto switch the Ruby version on directory change.
# zstyle ':prezto:module:ruby:chruby' auto-switch 'yes'

#
# Screen
#

# Auto start a session when Zsh is launched in a local terminal.
# zstyle ':prezto:module:screen:auto-start' local 'yes'

# Auto start a session when Zsh is launched in a SSH connection.
# zstyle ':prezto:module:screen:auto-start' remote 'yes'

#
# SSH
#

# Set the SSH identities to load into the agent.
# zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_rsa2' 'id_github'

#
# Syntax Highlighting
#
#
zstyle ':prezto:module:syntax-highlighting' color 'yes'

# Set syntax highlighters.
# By default, only the main highlighter is enabled.
# zstyle ':prezto:module:syntax-highlighting' highlighters \
#  'main' \
#  'brackets' \
#  'pattern' \
#  'line' \
#  'cursor' \
#  'root'

# Set syntax highlighting styles.
# zstyle ':prezto:module:syntax-highlighting' styles \
#   'builtin' 'bg=blue' \
#   'command' 'bg=blue' \
#   'function' 'bg=blue'

# Set syntax pattern styles.
#zstyle ':prezto:module:syntax-highlighting' pattern \
#    'rm*-rf*' 'fg=white,bold,bg=red'

#
# Terminal
#

# Auto set the tab and window titles.
# zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the window title format.
# zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'

# Set the tab title format.
# zstyle ':prezto:module:terminal:tab-title' format '%m: %s'

# Set the terminal multiplexer title format.
# zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

#
# Tmux
#

# Auto start a session when Zsh is launched in a local terminal.
# zstyle ':prezto:module:tmux:auto-start' local 'yes'

# Auto start a session when Zsh is launched in a SSH connection.
# zstyle ':prezto:module:tmux:auto-start' remote 'yes'

# Integrate with iTerm2.
# zstyle ':prezto:module:tmux:iterm' integrate 'yes'

# Set the default session name:
# zstyle ':prezto:module:tmux:session' name 'YOUR DEFAULT SESSION NAME'

#
# Utility
#

# Enabled safe options. This aliases cp, ln, mv and rm so that they prompt
# before deleting or overwriting files. Set to 'no' to disable this safer
# behavior.
# zstyle ':prezto:module:utility' safe-ops 'yes'
" >> ~/.zpreztorc

echo "# some listing aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias j='autojump'

mkdir -p $HOME/.local/bin
export PATH='$PATH:$HOME/.local/bin'

# Aliases
alias untar='tar -zxvf' # Unpack .tar file
alias wget='wget -c' # Download and resume
alias getpass='openssl rand -base64 20' # Generate password
alias getip='curl ifconfig.me' # Get ip public 
alias sha='shasum -a 256' # Check shasum
alias ping='ping -c 5' # Limit ping to 5'
alias www='php -S localhost:8000' # Run local webserver

# Custom functions
hello_world () {
    echo "Hello world"
}

unsetopt correct_all
unsetopt correct

eval \$(thefuck --alias f)
" >> ~/.zshrc

source ~/.zshrc

# diff so fancy

# docker compose, ctop, etc

# oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# vimrc
sudo git clone --depth=1 https://github.com/amix/vimrc.git /opt/vim_runtime
# to install for all users with home directories, note that root will not be included
sudo sh /opt/vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime --all


# fzf install and intergrated
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
