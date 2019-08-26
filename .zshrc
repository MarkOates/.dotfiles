

# convenience aliases for shell
alias ls='ls -Ga'
alias ll='ls -l'
alias la='ls -la'


# mdircd to make a new dir and enter into it
mkcd () {
  mkdir "$1"
  cd "$1"
}


kitkill() {
  ps aux | grep sewing | grep node_modules | awk "{print $2}" | xargs kill
}


# have readable folder/file colors in the shell
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced



# path stuff
export PATH=$PATH:/Users/markoates/Repos/CastXMLSuperbuild-build/castxml/bin
export PATH="$PATH:/usr/bin:/usr/local/bin/" # for https://stackoverflow.com/a/3958169/6072362

alias h='~/Repos/hexagon/bin/programs/hexagon'
alias lilypond='~/Repos/fullscore/bin/scripts/lilypond'
alias lily=lilypond


alias ngrok='~/Applications/ngrok'


function git_fixup(){
  git commit -m "f $1"
  echo '(dummy content)' > 'foobar.txt'
  git add .
  git commit -m 'temporary commit of worktree changes'
  git rebase -i $1~
  git reset head~
  rm 'foobar.txt'
}


# convience aliases for git
alias m='make -j8'
alias mc='make clean'
alias mt='make tests -j8'
alias gs='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git status'
alias gd='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff'
alias gds='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff --staged'
alias gl1mh='git log --pretty=tformat:'\''%an%x09%ad%x09%C(yellow)%h%Creset%x09%s'\'' --date=format:'\''%Y-%m-%d %H:%M:%S'\''  master..HEAD'
alias gl='echo " ------------------ USE FANCY LOG INSTEAD -------------------"; gl1mh'
alias gla='git log --pretty=tformat:'\''%C(yellow)%h%Creset%x09%an%x09%ad%x09%s'\'' --date=format:'\''%Y-%m-%d %H:%M:%S'\'''
alias gsh='git show head'
alias gl8='gla -8'
alias gb='git branch --sort=-committerdate'
alias ga='git add'
alias gp='git pull'
alias gr='git reset'
alias grp='git reset --patch'
alias gf='git_fixup'
alias gc='git checkout'
alias gap='git add --patch'
# alias gc='git checkout'
alias gg='git grep'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gcm='git commit -m'
alias gca='git commit --amend'
# alias kitkill="ps aux | grep sewing | grep node_modules | awk '{print $2}' | xargs kill"


alias okta='open https://shopify.okta.com/app/UserHome'



# conviences for werk
alias d='dev'
alias dcd='dev cd'
alias dt='dev test'
alias dc='dev console'
alias ds='dev server'
alias rc='rails console'
alias rs='rails server'
alias ssdt='spring stop; dev test'
#alias vi='h -f '
#alias no_i_want_to_vim='vim'


function vim_with_component_setup(){
  vim -c "so ~/Repos/vim-component-arranger/comparr.vim | call ArrangeVimFor(\"$1\")"
}



# aliases to projekts
alias fb='~/Repos/ncurses-art/bin/fancy_branch'
alias fl='~/Repos/ncurses-art/bin/fancy_log'
alias fs='~/Repos/ncurses-art/bin/fancy_stager'
alias ff='~/Repos/ncurses-art/bin/fancy_find'
alias fc='~/Repos/ncurses-art/bin/fancy_command'
alias fcl='~/Repos/ncurses-art/bin/fancy_component_lister'
alias fd='~/Repos/ncurses-art/bin/fancy_docs'
alias rcg='~/Repos/ncurses-art/bin/rails_class_generator'
alias status='~/Repos/ncurses-art/bin/status_fetcher'
alias b='~/Repos/ncurses-art/bin/builder2'
alias g='~/Repos/blast/bin/programs/generator'
alias cg='~/Repos/blast/bin/programs/component_generator'
alias qfj='~/Repos/blast/bin/programs/quintessence_from_json'
alias qfy='~/Repos/blast/bin/programs/quintessence_from_yaml'
alias project_filename_generator='~/Repos/ncurses-art/bin/project_filename_generator'
alias lsq="find quintessence/**/*.q.*"
alias bb="ruby /Users/markoates/Repos/beebot/lib/runner.rb"
alias beebot="bb"
alias project='function _change_project_directory(){ cd ~/Repos/$1; };_change_project_directory'




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


# for chruby
#source /usr/local/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh

