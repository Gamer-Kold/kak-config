# This is the bit of my config for configuring the built in kakoune tmux interop

declare-user-mode win
map -docstring "window bindings" global user w ":enter-user-mode win<ret>"
map -docstring "create a new kakoune window" global win n ":new<ret>"
map -docstring "create a new terminal window" global win t ":terminal fish<ret>"
map -docstring "open file picker" global win f ":open-yazi<ret>"

#TODO: this breaks if you select more than one file in yazi

define-command open-yazi %{
    edit %sh{
        rm /tmp/yazi_kak_files
        $(echo $kak_opt_termcmd) 'yazi --chooser-file=/tmp/yazi_kak_files'
        cat /tmp/yazi_kak_files
    }
}

