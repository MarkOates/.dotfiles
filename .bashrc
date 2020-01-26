alias vi='vim'
alias gds='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git diff --staged'
alias ga='git add'
alias gs='echo " ------------------ USE FANCY STATUS INSTEAD -------------------"; git status'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gc='git checkout'
alias gr='git reset'
alias grp='git reset --patch'
alias gl1mh='git log --pretty=tformat:'\''%an%x09%ad%x09%C(yellow)%h%Creset%x09%s'\'' --date=format:'\''%Y-%m-%d %H:%M:%S'\''  master..HEAD'
alias gl='echo " ------------------ USE FANCY LOG INSTEAD -------------------"; gl1mh'

export MSYS=winsymlinks:nativestrict
