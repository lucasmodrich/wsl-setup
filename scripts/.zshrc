# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# --------------------------- Theme ------------------------------------
# ZSH theme
#ZSH_THEME="powerlevel10k/powerlevel10k"

# --------------------------- Paths ------------------------------------
# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# Support 256 colors path
export TERM="xterm-256color"

# npm ENV
# Fix EACCES permissions errors when installing packages globally
NPM_CONFIG_PREFIX=~/.npm-global

# --------------------------- Plugins ----------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  #asdf
  #colored-man-pages
  #extract
  #F-Sy-H
  zsh-autosuggestions
  zsh-completions
  git
  #ssh-agent
  gpg-agent
  keychain
)

zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities $HOME/.ssh/id_ed25519_LMX1
zstyle :omz:plugins:keychain options --nogui
source $ZSH/oh-my-zsh.sh

# --------------------------- Aliases ----------------------------------
# Copy SSH
alias copyssh="cat < ~/.ssh/id_ed25519.pub | clip.exe | echo '=> Public SSH key copied.'"

# Open developer directory
alias dev="${DEV_DIRECTORY}"

# Open Explorer in current folder
alias explorer="explorer.exe ."

# Open .gitconfig in VSCode
alias gitcfg="code ~/.gitconfig"

# List outdated npm packages installed globally
alias npmcheck="npm outdated -g --depth=0"

# List npm packages installed globally
alias npmlist="npm list -g --depth=0"

# Update npm packages installed globally
alias npmupdate="npm update -g"

# Open Windows user directory
alias winhome="/mnt/c/Users/$(echo $USER)"

# Open .zshrc in VSCode
alias zshcfg="code ~/.zshrc"

# BW (Bitwarden Cli Snap)
alias bw="snap run bw"

# Hugo Snap Alias
alias hugo="snap run hugo"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Oh My Posh
eval "$(oh-my-posh init zsh)"