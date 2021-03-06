start_time=$(gdate '+%s.%3N')
export BREW_PREFIX=$(brew --prefix)
export ZPLUG_HOME=$BREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh

# Get useful stuff from oh-my-zsh libs
zplug "lib/completion", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/keybindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh

# Plugins (in alphabetical order)
# bgnotify <title> <message> to issue notification
zplug "plugins/bgnotify", from:oh-my-zsh

# Colors in man pages
zplug "plugins/colored-man-pages", from:oh-my-zsh

# Some common aliases (TODO: Learn these)
zplug "plugins/common-aliases", from:oh-my-zsh

# Copy current commandline entry to clipboard with ctrl-o
zplug "plugins/copybuffer", from:oh-my-zsh

# Copy pwd to cliboard
zplug "plugins/copydir", from:oh-my-zsh

# Some osx related stuff (like ofd, cdf, hidefiles, showfiles, man-preview)
zplug "plugins/osx", from:oh-my-zsh

# Extract any directory with extract
zplug "plugins/extract", from:oh-my-zsh

# Load fasd
zplug "plugins/fasd", from:oh-my-zsh

# Completions for git-extras
zplug "plugins/git-extras", from:oh-my-zsh

# Maven integration
zplug "plugins/mvn", from:oh-my-zsh

# pyclean, pygrep, pyfind
zplug "plugins/python", from:oh-my-zsh

# Completions for pip
zplug "plugins/pip", from:oh-my-zsh

# vagrant completions
zplug "plugins/vagrant", from:oh-my-zsh

# docker completions
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

# kubernetes & minikube completions
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/minikube", from:oh-my-zsh

# aws
zplug "plugins/aws", from:oh-my-zsh

# google, ddg (duckduckgo), github, youtube, maps ... (web search)
zplug "plugins/websearch", from:oh-my-zsh

zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh

forgit_log=fglo
forgit_diff=fgd
forgit_add=fga
forgit_reset_head=fgrh
forgit_ignore=fgi
forgit_restore=fgcf
forgit_clean=fgclean
forgit_stash_show=fgss
zplug 'wfxr/forgit'

# Suggest command based on recent commands
zplug "zsh-users/zsh-autosuggestions"

# Get zsh completions for a bunch of programs
zplug "zsh-users/zsh-completions"

# Syntax highlighting on commands (green/red)
zplug "zsh-users/zsh-syntax-highlighting", defer:2


# Pure theme - minimal, fast
zplug mafredri/zsh-async, from:github, defer:0
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# Add ts to right
# RPROMPT="[%h] [%D{%H:%M:%S %d-%m-%y}]"

st=$(gdate '+%s.%3N')
zplug load
et=$(gdate '+%s.%3N')
#echo "load time=" $(echo $et - $st | bc)

end_time=$(gdate '+%s.%3N')
time_taken=$(echo $end_time - $start_time | bc)
#echo "Zplug Loaded in $time_taken seconds"
#unset start_time end_time time_taken

# Useful for general debugging
debug() {
  if [[ ! -z $AVMOHAN_DEBUG ]]; then
    echo $*
  fi
}

# Super large history
HISTSIZE=100000
SAVEHIST=100000

# Set editor
export EDITOR=vi
export PATH="$HOME/local/bin:$HOME/go/bin:$HOME/opt/google-cloud-sdk/bin:/usr/local/opt/postgresql@11/bin:$BREW_PREFIX/opt/grep/libexec/gnubin:$BREW_PREFIX/opt/coreutils/libexec/gnubin:$BREW_PREFIX/opt/findutils/libexec/gnubin:$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$BREW_PREFIX/opt/curl/bin:$BREW_PREFIX/opt/openssl/bin:/usr/local/opt/protobuf@3.7/bin:$PATH"
export MANPATH="$BREW_PREFIX/opt/coreutils/libexec/gnuman:$BREW_PREFIX/opt/gnu-indent/libexec/gnuman:$BREW_PREFIX/opt/gnu-tar/libexec/gnuman:$BREW_PREFIX/opt/grep/libexec/gnuman:$BREW_PREFIX/opt/gnu-sed/libexec/gnuman:$BREW_PREFIX/opt/gawk/libexec/gnuman:$BREW_PREFIX/opt/findutils/libexec/gnuman:$MANPATH"

# Source work stuff
if [[ -f ~/.dotfiles/work/init.zsh ]]; then
  . ~/.dotfiles/work/init.zsh
fi

# Source private stuff
if [[ -f ~/.dotfiles/private/misc.zsh ]]; then
  . ~/.dotfiles/private/misc.zsh
fi
set -o emacs

export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
alias ls='ls --color'

# Test internet connectivity (GET google and check response status)
alias testnet='curl -k -s -o /dev/null -w "%{http_code}\n" https://www.google.com'

# Locale handling code
# TODO: Fix this properly
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

source ~/.dotfiles/lib/git.zsh
source ~/.dotfiles/lib/jira.zsh
source ~/.dotfiles/lib/pushnotify.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $BREW_PREFIX/bin/vault vault

# Add kubectx to $PS1
source "$BREW_PREFIX/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

# pretty print json with color
alias -g JL=" | jq -C | less -R"
# same for k8s
alias -g KJL=" -o json| jq -C | less -R"
# yaml
alias -g KYL=" -o yaml| yq -C read - | less -R"

source ~/.fzf.zsh

end_time=$(gdate '+%s.%3N')
time_taken=$(echo $end_time - $start_time | bc)
#echo "Total time taken = $time_taken seconds"

uts() {
  date -d @$(echo "$1" | cut -c -10)
}
