# Set the colour scheme
colorscheme solarized-dark
# Width of a tab
set-option global tabstop 4

# Indent with 4 spaces
set-option global indentwidth 4

# Always keep one line and three columns displayed around the cursor
set-option global scrolloff 1,3

# Display line numbers
add-highlighter global/ number-lines -hlcursor -relative

# Highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error

# Softwrap long lines
add-highlighter global/ wrap -word -indent

# Clipboard management mappings
map -docstring "yank the selection into the clipboard" global user y "<a-|> xsel -i<ret>"
map -docstring "paste the clipboard" global user p "<a-!> xsel<ret>"

# Make it so that the change and delete commands do not write to the clipboard
map -docstring "change selection" global normal c '"_c'
map -docstring "change selection" global normal d '"_d'

# source plugins

#Kak-Harpoon
source plugins/kak-harpoon/harpoon.kak

# LSP
eval %sh{kak-lsp --kakoune -s $kak_session} 
lsp-enable

# Shortcut to quickly exit the editor
define-command -docstring "save and quit" x "write-all; quit"

