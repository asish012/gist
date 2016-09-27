# prevent echoing ^C when you press Ctrl+C
stty -ctlecho

alias install='sudo apt-get install'

alias f='find -iname'

alias la='ls -A'
alias ll='ls -Alh'

alias massif='valgrind --tool=massif --time-unit=B'

# car-root toolchain
alias c=/home/asishbiswas/projects/mgu/sdks/latest/opt/nativesysroot/usr/bin/carroot