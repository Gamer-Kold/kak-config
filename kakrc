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
map -docstring "yank the selection into the clipboard" global user y "<a-|> xsel -i -b<ret>"
map -docstring "paste the clipboard" global user p "<a-!> xsel<ret>"

# Source the rest of the config
source "%val{config}/conf/window.kak"

# source plugins

#Kak-Harpoon
# source plugins/kak-harpoon/harpoon.kak

# LSP
eval %sh{kak-lsp --kakoune}
lsp-enable

# OLS config
hook -group lsp-filetype-odin global BufSetOption filetype=odin %{
    set-option buffer lsp_servers %{
        [ols]
        args = []
        root_globs = ["ols.json", "odinfmt.json", "*.odin", ".git", ".hg"]
	}
}
hook -group lsp-filetype-html global BufSetOption filetype=html %{
    set-option buffer lsp_servers %{
        [superhtml]
        root_globs = ["package.json", ".git", ".hg"]
        args = ["lsp"]
    }
}
map -docstring "enter lsp mode" global user l ":enter-user-mode lsp<ret>"
map -docstring "enter lsp mode" global normal <a-k> ":lsp-hover<ret>"
map -docstring "enter lsp mode" global normal <a-K> ":lsp-hover-buffer<ret>"

# Shortcut to quickly exit the editor
define-command -docstring "save and quit" x "write-all; quit"

