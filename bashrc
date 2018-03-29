### .bashrc ###

### User specific aliases and functions ###
alias la='ls -a'

#alias ls='ls --color=auto'
#alias grep='grep --color=auto'

### Slicer Package Manager Project ###
alias spm="slicer_package_manager_client"
alias spm2="spm --api-url http://192.168.113.208:8080/api/v1"
eval "$(_SLICER_PACKAGE_MANAGER_CLIENT_COMPLETE=source slicer_package_manager_client)"

### Source global definitions ###
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PATH="$PATH:~/bin:/usr/local/Cellar"
export PATH="$PATH:/usr/local/sbin"

### git status with a dirty flag ###
function __git_status_flag {
  git_status="$(git status 2> /dev/null)"
  clean_pattern="working directory clean" # For macOS: "working tree clean" For Linux: "working directory clean"
  ahead_pattern="Your branch is ahead"
  behind_pattern="Your branch is behind"
  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ! ${git_status} =~ ${clean_pattern} ]]; then
    state="⚡ "
  fi

  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="!"
  elif [[ ${git_status} =~ ${ahead_pattern} ]]; then
    remote="🔺 "
  elif [[ ${git_status} =~ ${behind_pattern} ]]; then
    remote="🔻 "
  fi

  echo "${state}${remote}"
}

### The prompt itself ###
PS1='\[\e[32m\]\u@\[\e[1m\]\h\[\e[22m\]:\[\e[1;34m\]\w\[\e[22;35m\]$(__git_ps1 " [\[\e[33m\]$(__git_status_flag)\[\e[35m\]%s]")\[\e[33m\] \$ \[\e[0m\]'

source ~/.git-completion.bash
source ~/.git-prompt.sh
