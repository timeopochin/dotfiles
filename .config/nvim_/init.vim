"==========Plugins=========="

" Get vim-plug if it is not downloaded
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Download the plugins
call plug#begin('~/.local/share/nvim/plugged')

" Soft wrapping
Plug 'reedes/vim-pencil'

" Distraction free editing
Plug 'junegunn/goyo.vim'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Fold indents
Plug 'tmhedberg/SimpylFold'

" Use ranger in vim
Plug 'francoiscabrol/ranger.vim'

" Gruvbox Colours
Plug 'morhetz/gruvbox'

call plug#end()

"==========Plugin Settings=========="

"-----vim-pencil-----"
"-----goyo-----"
"-----syntastic-----"
"-----SimpylFold-----"
"-----ranger-----"
nnoremap <silent> ; :RangerCurrentFile<cr>
let g:ranger_replace_netrw=1

"==========Vim Settings=========="

" Basic
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8

" Colours
let g:gruvbox_italic=1
colorscheme gruvbox

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set foldmethod=syntax
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=238
match ExtraWhitespace /\s\+$\|\t/

" More settings
set number relativenumber
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch

"==========My Settings=========="

" Opening a RMarkdown File
augroup rmarkdown
    autocmd!
    autocmd BufRead,BufNewFile *.rmd SoftPencil
    autocmd BufRead,BufNewFile *.rmd Goyo
    autocmd BufRead,BufNewFile *.rmd noremap <leader>l bveyi[<Esc>ea](<Esc>pa.html)<Esc>
    autocmd BufRead,BufNewFile *.rmd set filetype=rmarkdown
    autocmd BufNewFile *.rmd -1read ~/.Config/nvim/templates/skeleton.md
    autocmd BufWritePost *.rmd RMarkdown
augroup END

"==========Keybindings=========="

" Set the leader
let mapleader=','

" Movement
nnoremap c h
vnoremap c h
noremap <space>c c
nnoremap t gj
vnoremap t j
noremap <space>t t
nnoremap s gk
vnoremap s k
noremap <space>s s
nnoremap r l
vnoremap r l
noremap <space>r r

" Toggle fold
nnoremap <Esc> za
