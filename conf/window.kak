# This is the bit of my config for configuring the built in kakoune tmux interop

declare-user-mode win
map -docstring "window bindings" global user w ":enter-user-mode win<ret>"
map -docstring "create a new kakoune window" global win n ":new<ret>"
map -docstring "create a new terminal window" global win t ":repl-new<ret>"
map -docstring "open file picker" global win f ":open-yazi<ret>"

define-command open-yazi %{
    echo %sh{
        rm /tmp/yazi-kak-files
        echo $kak_opt_termcmd
        printf "edit " | cat - /tmp/yazi-kak-files > $kak_command_fifo
    }
}

