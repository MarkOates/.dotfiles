

# convenience aliases for shell
alias ls='ls -Ga'
alias ll='ls -l'
alias la='ls -la'


# mdircd to make a new dir and enter into it
mkcd () {
  mkdir "$1"
  cd "$1"
}


# have readable folder/file colors in the shell
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced



# path stuff
export PATH=$PATH:/Users/markoates/Repos/CastXMLSuperbuild-build/castxml/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting



# convience aliases for git
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log'
alias gl1mh='git log --pretty=tformat:'\''%C(yellow)%h%Creset%x09%an%x09%ad%x09%s'\'' --date=short --reverse master..HEAD'
alias gl8='git log --pretty=tformat:'\''%C(yellow)%h%Creset%x09%an%x09%ad%x09%s'\'' --date=short -8'
alias gp='git pull'
alias gb='git branch'
alias ga='git add'
alias gc='git checkout'


# convience aliases for ruby/rails
alias be='bundle exec'


# allows you to use the varant repo from anywhere
# src/ folder will be mounted wherever you run `vagrant up`
export VAGRANT_CWD=~/Repos/vagrant



### setup the ruby environment
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi



###
### Format the prompt
###

### Shows state of the Versioning Control System (e.g. Git, Subversion, Mercurial
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git svn
precmd () {
    GIT_USER_EMAIL=`git config user.email`

    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{cyan}]%f as %F{cyan}'$GIT_USER_EMAIL'%f'
    } else {
        zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{red}●%f%F{cyan}]%f as %F{cyan}'$GIT_USER_EMAIL'%f'
    }

    vcs_info
}

### Detects the VCS and shows the appropriate sign
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '⚡' && return
    echo '%#'
}

### Needed for a pretty prompt
setopt prompt_subst # Enables additional prompt extentions
autoload -U colors && colors    # Enables colours

### My default prompt
PROMPT='╔══ %(!.%B%U$fg_bold[cyan]%n%f%u%b.%F{cyan}%n%f)@%F{magenta}%m%f ════ %F{cyan}%y%f ════ ${vcs_info_msg_0_}
╚══{ %F{yellow}%~%f }: %{$reset_color%}'
### My default prompt's right side
RPROMPT='%F{cyan}%D{%e.%b.%y %H.%M}%f%{$reset_color%}'

### My prompt for loops
PROMPT2='{%_}  '

### My prompt for selections
PROMPT3='{ … }  '

### So far I don't use "setopt xtrace", so I don't need this prompt
#PROMPT4=''

