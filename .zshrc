

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
alias gap='git add --patch'
# alias gc='git checkout'
alias gg='git grep'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gcm='git commit -m'
alias gca='git commit --amend'



# conviences for werk
alias d='dev'
alias dcd='dev cd'
alias dt='dev test'



# convience aliases for ruby/rails
alias be='bundle exec'
alias bi='bundle install'
alias rit='bundle exec ruby -Itest'


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
        zstyle ':vcs_info:*' formats '%F{cyan}%K{blue} %r %F{white}[%b%c%u%f%F{white}] %K{blue}%F{black}as '$GIT_USER_EMAIL'%f 
'
    } else {
        zstyle ':vcs_info:*' formats '%F{cyan}%K{blue} %r %F{white}[%b%c%u%f%F{red}●%f%F{white}] %K{blue}%F{black}as '$GIT_USER_EMAIL'%f  
'
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
PROMPT='${vcs_info_msg_0_}%K{166} %(!.%B%U$fg_bold[cyan]%n%f%u%b.%F{yellow}%n%f) %K{yellow}%F{black} %~ %F{yellow}%K{black}'$'\u25b6''%K{black}%F{white}%f%{$reset_color%} '

### My default prompt's right side
# RPROMPT=" %k%f""%F{166}%K{129}"$'\U02620'%f
RPROMPT='%F{cyan}%D{%e.%b.%y %H.%M}%f%{$reset_color%}'

### My prompt for loops
PROMPT2='{%_}  '

### My prompt for selections
PROMPT3='{ … }  '

### So far I don't use "setopt xtrace", so I don't need this prompt
#PROMPT4=''


[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
