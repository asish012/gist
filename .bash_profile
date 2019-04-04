
#   -----------------------------
#   MAKE TERMINAL BETTER
#   -----------------------------
# >>> Git Branch Name Prompt >>> #
# Color code #
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
dark_blue=$(tput setaf 4)
pink=$(tput setaf 5)
cyan=$(tput setaf 6)

function show_repo_type {
  git branch > /dev/null 2> /dev/null && echo '[git]' && return
  svn info > /dev/null 2> /dev/null && echo '[svn]' && return
  echo ''
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function parse_git_status {
  noupdated=`git status --porcelain 2> /dev/null | grep -E "^ (M|D)" | wc -l`
  nocommitted=`git status --porcelain 2> /dev/null | grep -E "^(M|A|D|R|C)" | wc -l`

  if [[ $noupdated -gt 0 ]]; then echo -n "*"; fi
  if [[ $nocommitted -gt 0 ]]; then echo -n "+"; fi
}

# Prompt setup #
#export PS1="[\[$green\]\u\[$reset\]@\[$yellow\]\h\[$reset\]] \[$red\]\w\[$reset$cyan\]\$(show_repo_type)\[$yellow\]\$(parse_git_branch)\$(parse_git_status)\[$reset\]: "
export PS1="[\[$yellow\]\u\[$reset\]@\[$green\]\h\[$reset\]] \[$cyan\]\$(show_repo_type)\[$yellow\]\$(parse_git_branch)\$(parse_git_status) \[$reset$cyan\][\w]\[$reset\]: "
# <<< Git Branch Name Prompt <<< #

#   -----------------------------
#   Aliases
#   -----------------------------
export EDITOR=/usr/bin/vim
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias la='ls -A'
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

alias qf="find . -iname "                    # qf:      Quickly search for file
f () { /usr/bin/find . -iname "$@" ; }       # f:       Find file under the current directory
fs () { /usr/bin/find . -iname "$@"'*' ; }   # fs:      Find file whose name starts with a given string
fe () { /usr/bin/find . -iname '*'"$@" ; }   # fe:      Find file whose name ends with a given string

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

#   -----------------------------
#   Special functions
#   -----------------------------
#   extract:  Extract most know archives with one command
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   -----------------------------
#   Anaconda3 2018.12 installer
#   -----------------------------
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/q479070/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/q479070/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/q479070/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/q479070/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
