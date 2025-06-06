# Set the colour scheme
colorscheme tomorrow-night
# Width of a tab
set-option global tabstop 4

# Indent with 4 spaces
set-option global indentwidth 4

# Always keep one line and three columns displayed around the cursor
set-option global scrolloff 10,3

# very important change
set-option global ui_options terminal_assistant=cat

# Display line numbers
add-highlighter global/ number-lines -hlcursor -relative

# Highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error

# Softwrap long lines
add-highlighter global/ wrap -word -indent

# Clipboard management mappings
map global user y "<a-|> xsel -i -b<ret>" -docstring "yank the selection into the clipboard"
map global user p "<a-!> xsel<ret>"       -docstring "paste the clipboard"

# Source the rest of the config
source "%val{config}/conf/window.kak"
source "%val{config}/conf/lsp.kak"

#Kak-Harpoon
# source plugins/kak-harpoon/harpoon.kak

# Shortcut to quickly exit the editor
define-command -docstring "save and quit" x "write-all; quit"

