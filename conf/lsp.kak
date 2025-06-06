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
map global user   l     ":enter-user-mode lsp<ret>"                                 -docstring "enter lsp mode"
map global normal <a-k> ":lsp-hover<ret>"                                           -docstring "lsp hover documentation"
map global normal <a-K> ":lsp-hover-buffer<ret>"                                    -docstring "lsp hover docs in a buffer"
map global insert <a-n> "<a-;>:lsp-snippets-select-next-placeholders<ret>"          -docstring "select the next snippet"

