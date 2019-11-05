# move up 1,2 or 3 directories 
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# don't show hidden files by default in long list 
alias ll='ls -lF'

alias untar='tar zxvf'

# git
alias gitstat='git status'

# conenctions
alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'
alias sshgla='ssh -X gpuws4-pc.psy.gla.ac.uk'
alias sshpony='ssh -X mattb@130.104.83.192'

# open applications with & to allow me to continue working in the terminal
alias spyder='spyder &'
alias itksnap='itksnap &'
alias fluxgui='fluxgui &' 
# alias chrome='google-chrome &'
# in case I start getting errors popping up in the terminal, 
# automatically open a new tmux window:
alias chrome='google-chrome & tmux new-window'
