# clear all aliases (this is so that a call to "source .zshrc" will not leave previously set aliases)
unalias -m '*'


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


# set the projects directory
export PROJECTS_DIRECTORY=/Users/markoates/Repos



# path stuff
export PATH=$PATH:/Users/markoates/Repos/CastXMLSuperbuild-build/castxml/bin
export PATH="$PATH:/usr/bin:/usr/local/bin/" # for https://stackoverflow.com/a/3958169/6072362

alias h='open /Applications/Hexagon.app'
alias lilypond='~/Repos/fullscore/bin/scripts/lilypond'
alias lily=lilypond


# alias ngrok='~/Applications/ngrok'



downscale_video()
{
   if [[ $# -lt 1 || $# -gt 3 ]]; then
      echo "Usage: downscale_video <input_file> [output_file] [height]"
      echo " - <input_file>: Path to the input video file"
      echo " - [output_file]: Optional. Defaults to <input_file>-small.<ext>"
      echo " - [height]: Optional. Defaults to 800"
      return 1
   fi

   input_file="$1"

   if [[ ! -f "$input_file" ]]; then
      echo "Error: Input file '$input_file' does not exist."
      return 1
   fi

   output_file="${2:-${input_file%.*}-small.${input_file##*.}}"
   height="${3:-800}"

   echo "Downscaling '$input_file' to '$output_file' with height $height..."

   ffmpeg -i "$input_file" \
      -vf "scale=-2:${height}" \
      -c:v libx264 -crf 28 -preset slow \
      -c:a aac -b:a 128k \
      -movflags +faststart \
      -fs 8M \
      "$output_file"
}



function git_fixup(){
  git commit -m "f $1"
  echo '(dummy content)' > 'foobar.txt'
  git add .
  git commit -m 'temporary commit of worktree changes'
  git rebase -i $1~
  git reset head~
  rm 'foobar.txt'
}


# convience aliases
alias f='fzf'
alias m='make -j8'
alias mc='make clean'
alias mt='make tests -j8'
alias gs='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git status'
alias gd='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff'
alias gds='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff --staged'
alias gdsn='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff --staged --name-only'
alias gl1mh='git log --pretty=tformat:'\''%an%x09%ad%x09%C(yellow)%h%Creset%x09%s'\'' --date=format:'\''%Y-%m-%d %H:%M:%S'\''  master..HEAD'
alias gl='echo " ------------------ USE FANCY LOG INSTEAD -------------------"; gl1mh'
alias gla='git log --pretty=tformat:'\''%C(yellow)%h%Creset%x09%an%x09%ad%x09%s'\'' --date=format:'\''%Y-%m-%d %H:%M:%S'\'''
alias gsh='git show head'
alias gl8='gla -8'
alias gb='git branch --sort=-committerdate'
alias ga='git add'
alias gp='git push'
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
alias rr='rerun --quiet -c -p "**/*.{rb,js,tsx,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature,c,h,cpp,hpp,txt,cfg}"'
# alias kitkill="ps aux | grep sewing | grep node_modules | awk '{print $2}' | xargs kill"
alias create_release='/Users/markoates/Repos/blast/bin/programs/create_source_release'
alias daemus='/Users/markoates/Repos/hexagon/bin/programs/daemus'
alias d='daemus'
alias sc='symlink_component'
alias server='(cd /Users/markoates/Business/CLUBCATT/web_files && python3 /Users/markoates/Repos/ClubCatt/host/server.py)'
alias s='server'
alias fresh='/Users/markoates/Repos/blast/scripts/make_fresh.sh'
alias dv="downscale_video"
alias ccs="(cd /Users/markoates/Business/CLUBCATT/web_files && python3 /Users/markoates/Repos/ClubCatt/host/server.py)"


alias l='~/Repos/blast/bin/programs/fancy_list /Users/markoates/Repos/me/fancy_lists/fancy_immediate_list.txt green'

alias import_asset='~/Repos/allegro_flare/bin/programs/asset_importer'
alias list_asset='~/Repos/allegro_flare/scripts/list_asset.sh'
alias sync_assets='~/Repos/AssetStudio/scripts/remote_asset_sync.sh'



alias okta='open https://shopify.okta.com/app/UserHome'



# conviences for werk
#alias d='dev'
alias dcd='dev cd'
alias dt='dev test'
alias dc='dev console'
alias ds='dev server'
alias rc='rails console'
alias rs='rails server'
alias ssdt='spring stop; dev test'
alias vo='vi -o `fzf`'
#alias vi='h -f '
#alias no_i_want_to_vim='vim'


function vim_with_component_setup(){
  vim -c "so ~/Repos/vim-component-arranger/comparr.vim | call ArrangeVimFor(\"$1\")"
}



# Load some env vars

source ~/.config/.app-env


# https://stackoverflow.com/questions/40429865/how-to-exit-bash-function-if-error

function _move_to_projects_dir_and_generate(){
  # For now, need to go to the projects directory because the Makefile (and probably other files) are symlinked relative to Repos/
  cd $PROJECTS_DIRECTORY && \
  ~/Repos/blast/bin/programs/generator $1 && \
  cd $1 && \
  git init && \
  git add . && \
  git commit -m 'Initial commit'
}

function _move_to_projects_dir(){
  cd "$PROJECTS_DIRECTORY/$1"
}


# aliases to projekts
alias fb='~/Repos/blast/bin/programs/fancy_branch'
alias fl='~/Repos/blast/bin/programs/fancy_log'
alias fs='~/Repos/blast/bin/programs/fancy_stager'
alias ff='~/Repos/blast/bin/programs/fancy_find'
#alias fc='~/Repos/blast/bin/programs/fancy_command'
alias fc='~/Repos/blast/bin/programs/fancy_list /Users/markoates/Repos/me/fancy_lists/fancy_commands.txt white'
alias fcl='~/Repos/blast/bin/programs/fancy_component_lister'
alias c='~/Repos/blast/bin/programs/fancy_component_lister'
#alias fd='~/Repos/blast/bin/programs/fancy_docs'
#alias fd='~/Repos/blast/bin/programs/fancy_list /Users/markoates/Repos/me/fancy_lists/fancy_docs.txt white'
alias fd='~/Repos/blast/bin/programs/fancy_debug'
alias rcg='~/Repos/blast/bin/programs/rails_class_generator'
alias old_status='~/Repos/blast/bin/programs/ncurses_status_fetcher'
alias status='~/Repos/blast/bin/programs/status'
alias games_status='~/Repos/blast/bin/programs/status_fetcher games'
alias system_test='~/Repos/blast/bin/programs/system_test'
alias b='~/Repos/blast/bin/programs/builder2'
alias generate='_move_to_projects_dir_and_generate'
alias cg='~/Repos/blast/bin/programs/component_generator'
alias qfj='~/Repos/blast/bin/programs/quintessence_from_json'
alias qfy='~/Repos/blast/bin/programs/quintessence_from_yaml'
alias symlink_component='~/Repos/blast/bin/programs/symlink_component_from_another_project'
alias rename_component='~/Repos/blast/bin/programs/component_renamer'
alias project_filename_generator='~/Repos/blast/bin/programs/project_filename_generator'
alias lsq="find quintessence/**/*.q.*"
alias bb="ruby /Users/markoates/Repos/beebot/lib/runner.rb"
alias beebot="bb"
alias project='_move_to_projects_dir'
alias p="project"
alias project_status="ruby /Users/markoates/Desktop/ProjectSetupChecker/project_setup_check.rb"
alias refresh="source ~/.zshrc"
alias kill_daemus="kill $(ps aux | grep "/Users/markoates/Repos/hexagon/bin/programs/daemus" | awk '{print $2}')"
alias count_daemus='ps aux | grep "/Users/markoates/Repos/hexagon/bin/programs/daemus" | grep "" -c'




#autoload -Uz compinit
#compinit

# Almost auto-completed: https://chat.openai.com/c/93fc4d7c-11f5-47ce-8eb1-66bd9c7ca517
#
# _my_custom_command_completion() {
    #echo "a"
    #local repo_directory="/Users/markoates/Repos/"

    ## Specify the directory for autocompletion
    ##_arguments '*: :_files - -/'"${repo_directory}"'*(-/)'
    #_arguments '*: :_files -' - /"${repo_directory}"'*(-/)'
# }

# compdef _my_custom_command_completion project



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
#source /usr/local/opt/chruby/share/chruby/chruby.sh

#source /usr/local/share/chruby/auto.sh

# have ruby 2.6.5 be the default without stressing about versions
# chruby 2.6.5


export FZF_DEFAULT_COMMAND='rg --files --hidden --glob="!{.git/*}"'


alias git-clean-br="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"


#if [ -e /Users/markoates/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/markoates/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer




# zsh auto-complete engine for command line arguments
#autoload -Uz compinit
#compinit

# source /Users/markoates/Repos/.dotfiles/compgens.zsh
