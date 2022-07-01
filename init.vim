set nocompatible              " \e iMproved, required
"filetype off                  " required
filetype plugin on "for vimWiki
syntax on

set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plugin 'elzr/vim-json'
Plugin 'SuperTab'
Plugin 'surround.vim'
Plugin 'Markdown'
" Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'easymotion/vim-easymotion'
Plugin 'tComment'
Plugin 'ZoomWin'
Plugin 'w0rp/ale'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'osyo-manga/vim-stripe'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" Plugs
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'

Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'arcticicestudio/nord-vim'
Plug 'navarasu/onedark.nvim'
Plug 'romgrk/doom-one.vim'

Plug 'sainnhe/sonokai'
Plug 'mangeshrex/everblush.vim'
Plug 'phanviet/vim-monokai-pro'
call plug#end()
filetype plugin indent on    " required
filetype indent on


" Color Scheme
"let g:onedark_config = {
"    \ 'style': 'deep',
"\}
"
        " Important!!
if has('termguicolors')
  set termguicolors
endif
"" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1
colorscheme sonokai
"colorscheme everblush 

set smarttab

" tagbar
map <F6> :TagbarToggle <CR>
map <F5> :NERDTreeToggle <CR>
map <c-p> :Files <CR>
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" open Nerd Tree when there was no file on the command line:
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

" map <c-p> :CtrlP <CR>
"let g:ctrlp_custom_ignore = 'coverage\|dist\|dist-*\|node_modules\|DS_Store\|git'
" "open ctrl p file in new buffer
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_prompt_mappings = {
"   \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
"    \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
"    \ }

set number
set showcmd
set cursorline
set wildmenu
set showmatch
set hlsearch
set incsearch
set clipboard+=unnamedplus
set mouse=a
" move vertically by visual line:
nnoremap j gj
nnoremap k gk
" set paste
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufWritePre *.js %s/\s\+$//e
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" easy motion, case insensitive
let g:EasyMotion_smartcase = 1

" ctrl w + o makes it full screen
nnoremap <silent> <C-w>w :ZoomWin<CR>


"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-tsserver', 
  \ 'coc-json', 
  \ 'coc-prettier', 
  \ ]


" goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#config#single_quote = 'true'

" linting / auto format on save
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fix_on_save = 0
let g:ale_linters = {
\'javascript': ['flow', 'eslint'],
\}
let g:ale_fixers = {
\'javascript': ['eslint'],
\}

" Tailwind settings


