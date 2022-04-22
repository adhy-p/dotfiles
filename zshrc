# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/adhy/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
TIMER_FORMAT='[%d]'; TIMER_PRECISION=2
plugins=(dirhistory git safe-paste timer zsh-syntax-highlighting)

source /etc/zsh_command_not_found
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
bindkey -v
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
alias zshconfig="vim ~/.zshrc"
alias open='xdg-open'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias ghidra='/opt/ghidra/ghidra_10.1.2_PUBLIC/ghidraRun'
