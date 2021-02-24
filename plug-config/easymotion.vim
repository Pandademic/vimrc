let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"nmap <localleader>j <Plug>(easymotion-j)
"nmap <localleader>k <Plug>(easymotion-k)
nmap <a-j> <Plug>(easymotion-j)
nmap <a-k> <Plug>(easymotion-k)
