# Edit my zsh configs
alias zshconfig='$EDITOR $DOTFILES/zsh/zshrc'

# Edit my aliases
alias aliases='$EDITOR $DOTFILES/zsh/aliases.zsh'

# Edit my extra configs
alias extras='$EDITOR $DOTFILES/zsh/extra.zsh'

# Edit my hosts file
alias hosts='sudo $EDITOR /etc/hosts'

# Edit my SSH hosts config
alias hostconf='$EDITOR ~/.ssh/config'

# Reload my CLI configs
alias reload="source ~/.zshrc"

# # Restart the computer
# alias restart="sudo shutdown -r now"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias code="cd ~/Code;pwd"
alias dl='cd ~/Downloads'
alias dotfiles="cd $DOTFILES"
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/;pwd'
alias library="cd $HOME/Library"
# alias www='cd ~/Code;pwd'


# Some aliases I used from oh-my-zsh
# see: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
alias la='ls -lAFh'
alias ll='ls -l'
alias ldot='ls -ld .*'
alias grep='grep --color'

# Prompt for confirmation before overwriting or deleting a file when copying/moving
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# Show/hide hidden files in Finder
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'

# Show/hide all desktop icons (useful when presenting)
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"

# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill='ps ux | grep '\''[C]hrome Helper --type=renderer'\'' | grep -v extension-process | tr -s '\'' '\'' | cut -d '\'' '\'' -f2 | xargs kill'

# Kill a runaway docker run command, when your test suite just don't want to finish...
alias dockerrunkill='ps | grep '\''docker run'\'' | grep -v grep | awk '\''{print $1}'\'' | xargs kill -9'

# For those times when you just don't look busy enough
alias busy='export GREP_COLOR='\''1;32'\''; cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"'

# Display a notification
# (useful when executing time-consuming commands)
alias notify='/usr/bin/osascript -e "display notification \"Finished!\" with title \"Zsh\""'

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Get macOS Software Updates, update Homebrew and its installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew upgrade --cask; brew cleanup;tldr --update'

# Check if I've got outdated versions of applications
alias outdated='brew outdated'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip='ipconfig getifaddr en0'
alias ips='ifconfig -a | grep -o '\''inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)'\'' | awk '\''{ sub(/inet6? (addr:)? ?/, ""); print }'\'''

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service (DNS) cache
# alias flush='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

# Pipe my public key to my clipboard.
# alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Show how much diskspace I got left (shouldn't have bought that puny 128GB MBA...)
alias diskspace="df -P -kHl"

# Clean-up the temporary/cache files in a Python project
# alias pyclean='find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +'

# Clean-up any dependencies that were installed outside a virtual environment
alias pipclean="pip list | awk '{if (NR>2) print $1}' | grep -v pip | grep -v setuptools | xargs pip uninstall -y"
alias pip3clean="pip3 list | awk '{if (NR>2) print $1}' | grep -v pip | grep -v setuptools | xargs pip uninstall -y"

# MISC
alias holdmybeer=sudo
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias tableflip="echo '(╯°□°）╯︵ ┻━┻' | pbcopy"

# Functions
weather() { curl -4 en.wttr.in/${1:-"montreal"} }

# Git checkout with branch name autocomplete using fzf (from: https://elijahmanor.com/byte/git-recent-branches)
alias cb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'
alias gits='git s'
