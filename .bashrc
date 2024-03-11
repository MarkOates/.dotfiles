


# This is the default PS1 value:
# export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '



# This imports a shared .sharedrc, which:
#  1. modifies the PS1 prompt value

SHAREDRC_LOCATION=$HOME/Repos/.dotfiles/.sharedrc
if [ -f $SHAREDRC_LOCATION ]
then
  source $SHAREDRC_LOCATION
else
  print "Error: Could not find the expected sharedrc file at $SHAREDRC_LOCATION"
fi



alias vi='vim'
alias gd='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff'
alias gds='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff --staged'
alias ga='git add'
alias gap='git add --patch'
alias gs='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git status'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gc='git checkout'
alias gr='git reset'
alias grp='git reset --patch'
alias gl1mh='git log --pretty=tformat:'\''%an%x09%ad%x09%C(yellow)%h%Creset%x09%s'\'' --date=format:'\''%Y-%m-%d %H:%M:%S'\''  master..HEAD'
alias gl='echo " ------------------ USE FANCY LOG INSTEAD -------------------"; gl1mh'

export MSYS=winsymlinks:nativestrict


function _move_to_projects_dir_and_generate(){
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


alias generate='_move_to_projects_dir_and_generate'
alias cg='~/Repos/blast/bin/programs/component_generator'
alias status='~/Repos/blast/bin/programs/status'


# This next line permits installed gem binaries to be run on the system
# see this site for more details:
# https://askubuntu.com/questions/406643/warning-you-dont-have-a-directory-in-your-path-gem-executables-will-not-run
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# rerun alias
alias rr='rerun --quiet -c -p "**/*.{rb,js,tsx,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature,c,h,cpp,hpp,txt,cfg}"'


export TERM=xterm-256color
export TERMINFO=/mingw64/share/terminfo



alias gcloud='echo " ------------------ NOTICE: this usage of gcloud is an alias in .bashrc -------------------"; "/C/Users/Mark/AppData/Local/Google/Cloud SDK/google-cloud-sdk/bin/gcloud"'



cd ~/Repos
