set nocompatible
let &t_TI = ""
let &t_TE = ""
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let g:loaded_netrw       = 1
"let g:loaded_netrwPlugin = 1
let g:netrw_fastbrowse = 0

"imap jk <ESC>

filetype off
syntax on

set autoindent
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=120
set encoding=utf-8
set expandtab
set guioptions=
set guifont=SauceCodePro\ Nerd\ Font\ Regular\ 11.5
set guifontwide=Sans\ Regular\ 11.5
set nobackup
set noswapfile
set nowritebackup
set number
set relativenumber
set shiftwidth=4
set shortmess+=c
set showtabline=2
set laststatus=2
set tabstop=4
set pumheight=10 " popup menu height
set termguicolors
set noautochdir
set scrolloff=3
set sidescrolloff=3
set timeoutlen=500
set wildmenu
set mouse=a
set hlsearch

autocmd FileType c,cpp setlocal shiftwidth=2
autocmd FileType c,cpp setlocal tabstop=2

autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,vim,shell let g:indentLine_conceallevel=2

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" According to plug name alphabetical order
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-denops/denops.vim'
"Plug 'Shougo/ddu.vim'
"Plug 'Shougo/ddu-ui-ff'
"Plug 'Shougo/ddu-ui-filer'

" Install your UIs

" Install your sources

" Install your filters

" Install your kinds

" Install your columns

"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'

Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'Yggdroot/indentLine'
Plug 'kdheepak/JuliaFormatter.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'cohama/lexima.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdcommenter'
Plug 'lambdalisue/fern.vim'
Plug 'dracula/vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 't9md/vim-choosewin'
Plug 'arzg/vim-colors-xcode'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'felipec/vim-felipec'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-grepper'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'andymass/vim-matchup'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'iandwelker/rose-pine-vim'
Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot'
"Plug 'airblade/vim-rooter'
Plug 'puremourning/vimspector'
Plug 'mhinz/vim-startify'
"Plug 'sheerun/vim-polyglot'
Plug 'mg979/vim-visual-multi'
Plug 'liuchengxu/vim-which-key'

call plug#end()

"""""""""""""""" sonokai themes
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:edge_style = 'aura'
let g:edge_better_performance = 1
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1

"set background=light
set background=dark
colorscheme catppuccin_macchiato

" insert this line above imap
call lexima#init()

"""""""""""""""" gutentags
let g:gutentags_enabled = 0

"""""""""""""""" vim-visual-multi
"let g:VM_maps = {}
"let g:VM_maps['Find Under']         = '<C-s>'           " replace C-n
"let g:VM_maps['Find Subword Under'] = '<C-s>'           " replace visual C-n

"""""""""""""""" which-key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
call which_key#register('<Space>', "g:which_key_map")
"call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" Define prefix dictionary
let g:which_key_map =  {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'        , 'other-window']          ,
      \ 'd' : ['<C-W>c'        , 'delete-window']         ,
      \ '2' : ['<C-W>v'        , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'        , 'window-left']           ,
      \ 'j' : ['<C-W>j'        , 'window-below']          ,
      \ 'l' : ['<C-W>l'        , 'window-right']          ,
      \ 'k' : ['<C-W>k'        , 'window-up']             ,
      \ 'o' : ['<C-W>o'        , 'window-only']             ,
      \ 'H' : ['<C-W>5<'       , 'expand-window-left']    ,
      \ 'J' : [':resize +5'    , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'       , 'expand-window-right']   ,
      \ 'K' : [':resize -5'    , 'expand-window-up']      ,
      \ '=' : ['<C-W>='        , 'balance-window']        ,
      \ 's' : ['<C-W>s'        , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'        , 'split-window-right']    ,
      \ }

"""""""""""""""" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

"""""""""""""""" tagbar
nmap <F4> :Vista!!<CR>
nmap - :vert res -5<CR>
nmap = :vert res +5<CR>

"""""""""""""""" gitgutter
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)

"""""""""""""""""" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:vimspector_variables_display_mode = 'full'
map <silent><leader>cl <plug>NERDCommenterToggle
xmap <silent><leader>fm <Plug>(coc-format-selected)
nmap <silent><leader>fm :call CocActionAsync('format')<CR>

"""""""""""""""" vim-floaterm
nnoremap   <silent>   <S-F7>    :FloatermPrev<CR>
tnoremap   <silent>   <S-F7>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F7>    :FloatermNext<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F8>   :FloatermToggle<CR>
tnoremap   <silent>   <F8>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <S-F8>    :FloatermNew<CR>
tnoremap   <silent>   <S-F8>    <C-\><C-n>:FloatermNew<CR>

"""""""""""""""" coc
source $HOME/vimrc/coc.vim


"""""""""""""""" filer
if 0
" Use fern as file tree
  nnoremap <silent> <F3> :Fern . -reveal=%:p -drawer -toggle<CR>
  nnoremap <silent> <leader>ft :Fern . -reveal=%:p -drawer -toggle<CR>
  "nnoremap <silent> <F3> :Fern %:h -reveal=%:p -drawer -toggle<CR>
  "nnoremap <silent> <leader>ft :Fern %:h -reveal=%:p -drawer -toggle<CR>
else
" Use coc-explorer as file tree
  nnoremap <silent> <F3> :CocCommand explorer<CR>
  nnoremap <silent> <leader>ft :CocCommand explorer<CR>
endif

"""""""""""""""""" fzf-vim
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
map <leader>bb :Buffers<CR>
map <leader>ff :Files<CR>
map <leader>fh :History<CR>
map <leader>fr :History<CR>
map <leader>pf :ProjectFiles<CR>
nnoremap <silent> <Leader>sa :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>sr :Rg <C-R><C-W><CR>
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

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
map <localleader>j <Plug>(easymotion-j)
map <localleader>k <Plug>(easymotion-k)

"""""""""""""""""" neoformat
map <leader>bf :Neoformat<CR>

"""""""""""""""""" vim-choosewin
" invoke with '-'
nmap _ <Plug>(choosewin)

"""""""""""""""""" buffercmd
"noremap <silent> <leader>1 :<C-u>b1<CR>
"noremap <silent> <leader>2 :<C-u>b2<CR>
"noremap <silent> <leader>3 :<C-u>b3<CR>
"noremap <silent> <leader>4 :<C-u>b4<CR>
"noremap <silent> <leader>5 :<C-u>b5<CR>
"noremap <silent> <leader>6 :<C-u>b6<CR>
"noremap <silent> <leader>7 :<C-u>b7<CR>
"noremap <silent> <leader>8 :<C-u>b8<CR>
"noremap <silent> <leader>9 :<C-u>b9<CR>
"noremap <silent> <leader>0 :<C-u>b10<CR>

"""""""""""""""""" wincmd
noremap <silent> <localleader>1 :<C-u>1 wincmd w<CR>
noremap <silent> <localleader>2 :<C-u>2 wincmd w<CR>
noremap <silent> <localleader>3 :<C-u>3 wincmd w<CR>
noremap <silent> <localleader>4 :<C-u>4 wincmd w<CR>
noremap <silent> <localleader>5 :<C-u>5 wincmd w<CR>
noremap <silent> <localleader>6 :<C-u>6 wincmd w<CR>
noremap <silent> <localleader>7 :<C-u>7 wincmd w<CR>
noremap <silent> <localleader>8 :<C-u>8 wincmd w<CR>
noremap <silent> <localleader>9 :<C-u>9 wincmd w<CR>
noremap <silent> <localleader>0 :<C-u>10 wincmd w<CR>

"""""""""""""""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

"""""""""""""""""" JuliaFormatter
" normal mode mapping
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <localleader>jf :JuliaFormatterFormat<CR>

"""""""""""""""""" haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
