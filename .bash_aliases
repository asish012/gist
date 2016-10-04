# make sure your ~/.bashrc file contains following 3 lines (as active)
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi


# prevent echoing ^C when you press Ctrl+C
stty -ctlecho

# cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

alias install='sudo apt-get install'

alias f='find -iname'

alias la='ls -A'
alias ll='ls -Alh'

alias massif='valgrind --tool=massif --time-unit=B'

# Git
alias g='git'

# car-root toolchain
alias c=/home/asishbiswas/projects/mgu/sdks/latest/opt/nativesysroot/usr/bin/carroot
