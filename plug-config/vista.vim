let g:vista_sidebar_width = 45
let g:vista_curser_delay = 100
let g:vista_echo_cursor_stragegy = 'both'
" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'
let g:vista_finder_alternative_executives = ['coc', 'ctags', 'vim_lsp', 'nvim_lsp']
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

"" Set the executive for some filetypes explicitly. Use the explicit executive
"" instead of the default one for these filetypes when using `:Vista` without
"" specifying the executive.
"let g:vista_executive_for = {
  "\ 'cpp': 'vim_lsp',
  "\ 'php': 'vim_lsp',
  "\ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" This is the tagbar configuration
let g:tagbar_autofocus = 1
let g:tagbar_show_visibility = 1
let g:tagbar_previewwin_pos = "rightbelow"
let g:tagbar_width = 45

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
