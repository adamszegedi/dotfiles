[[ -f /run/.toolboxenv ]] && return

#File Management
alias space='sudo btrfs fi show'
alias ls='eza -ahlg --color=always --group-directories-first --octal-permissions' # my preferred listing
alias la='eza -ahg --color=always --group-directories-first --octal-permissions'  # all files and dirs
alias ll='eza -lhg --color=always --group-directories-first --octal-permissions'  # long format
alias lt='eza -ahTg --color=always --group-directories-first --octal-permissions' # tree listing

#Terminal
alias c='clear' 

# Sync to Drive
alias sync-to-drive='rclone sync -P ~/Documents proton:archie/Documents && rclone sync -P ~/Pictures proton:archie/Pictures'
alias sync-from-drive='rclone sync -P proton:archie/Documents ~/Documents && rclone sync -P proton:archie/Pictures ~/Pictures'
alias sync-check-drive='rclone check proton:archie/Documents ~/Documents && rclone check proton:archie/Pictures ~/Pictures'

#Cat
alias cat='bat'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'

# Generate sha1 digest
alias sha1='openssl sha1'

#5: Create parent directories on demand
alias mkdir='mkdir -pv'

#Show open ports
alias ports='sudo ss -tulpn'

# Add safety nets 
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#Get system memory, cpu usage, and gpu memory info quickly
## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

#Get my ipv6-address
alias get-ipv6="ip -6 addr show dev enp5s0 scope global | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d'"

## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

#Resume wget by default
## this one saved by butt so many times ##
alias wget='wget -c'

#weather
alias wttr='curl wttr.in/47.4143259,19.2005805'

# open lynx
alias lynx='lynx -cfg=~/.config/lynx/lynx.cfg --display_charset=utf-8'
