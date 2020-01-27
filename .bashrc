alias vi='vim'
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

