
# Define a custom completion function for the `my_command` command
#_my_command_completion() {
    ## Use the `_files` completion function to generate a list of file names
    #_files -g "${1}*" && return 0
#}


_my_command_completion() {
    local folder="/Users/markoates/Repos"
    _files -/ -g "${folder}/${1}*" && return 0
}


# Register the custom completion function for the `my_command` command
compdef _my_command_completion p

