" Status Bar
set shortmess=at
set showcmd "Show (partial) command in the last line of the screen
set laststatus=2 "2 always show status
set cmdheight=2

set nocompatible              " be iMproved, required
filetype off                  " required


" Tabs
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab " spaces instead of tab characters
autocmd FileType moon setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType sh setlocal shiftwidth=2 tabstop=2

" Search
set smartcase "ignore case if search pattern all lowercase
set wildignore+=*/.git/*,*/.hg/*,*/tmp/*,*.swp
"set showmatch
" Turn off highlight after select

if exists(':CmdlineEnter')

  augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup END

endif

" Text
set nofoldenable "When off, all folds are open.
if !exists('g:syntax_on')
  syntax on
endif
if has('termguicolors')
    set termguicolors
endif
colorscheme monokai-phoenix

" Commands
set ttimeoutlen=50 "Time in milliseconds to wait for a key code sequence to complete.

" Completion
set infercase

" Editor
set number "Show numbers
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lbr "If on, Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen. 
set tw=500
set wrap "Wrap lines
"" Indent
set ai "Auto indent
set si "Smart indent
"" Cursor
set cursorline
hi CursorLine cterm=NONE ctermbg=235
hi Visual cterm=NONE ctermbg=192 ctermfg=black
function! MyHighlights() abort
    hi MatchParen guifg=#111111 guibg=#E6DB74 gui=NONE ctermfg=15 ctermbg=197 cterm=NONE
endfunction
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

" Lang
filetype plugin indent on " required
autocmd StdinReadPre * let s:std_in=1

" Shortcuts
vnoremap <LeftRelease> "*ygv
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
map ;;t :tabedit<space>
imap zzl <Esc>A
imap zzk <Esc>A<cr>
imap zzj <Esc>}A<cr>
imap zzu <Esc>:u<cr>
imap zzw <Esc>:w!<CR>i
imap zzn <Esc>
imap ;;w <Esc>:w!<cr>
map ;;w <Esc>:w!<cr>
imap ;;wq <Esc>:wq!<cr>
map ;;wq <Esc>:wq!<cr>
map ;;c :lclose<cr>
map <Leader>e <c-y>,
map ;;q :q!<cr>
map <Leader><Leader>c :!
noremap ;;a <esc>ggVG<CR>
map ;;v :!cat ~/.vimrc<cr>
map ;;vo :tabedit ~/vim/.vimrc<cr>
map <Leader>wj <c-w>j
map <Leader>wk <c-w>k
map <Leader>wl <c-w>l
map <Leader>wh <c-w>h
map ;;help :!cat ~/vim/help.txt<cr>
map ;;s <Esc>^i
map ,,a :Autoformat<CR>
map <Leader>N :bnext<CR>
map <Leader>B :bprevious<CR>
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/")"
nmap <Leader>tj :JsDoc<CR>
map <Leader>mm :set mouse=a<cr>
map <Leader>mo :set mouse=<cr>
map <C-S-x> :Autoformat<CR>

if !exists(':YcmCompleter')
  " CTRL-P or CTRL-N are used
  set completeopt=menu,preview
  if exists('*completeopt#noselect')
    completeopt+=noselect,noinsert
  endif
  " Support for enter
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
endif
