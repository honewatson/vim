set nocompatible              " be iMproved, required
filetype off                  " required

"
" For lustyExplorer
"
set hidden
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'alexbyk/vim-ultisnips-js-testing', {'for': 'js'}

Plug 'Chiel92/vim-autoformat', {'for': ['html', 'css', 'js']}

Plug 'leafo/moonscript-vim', {'for': 'moonscript'}

Plug 'chaquotay/ftl-vim-syntax', {'for': 'freemarker'}

" reStructured Text
Plug 'Rykka/riv.vim', {'for': 'reStructuredText'}

" Display reStructured Text
Plug 'Rykka/InstantRst', {'for': 'reStructuredText'}

" Nim Lint
"Plug 'zah/nim.vim'
Plug 'baabelfish/nvim-nim', {'for': 'nim'}
" Less Lint
Plug 'groenewege/vim-less', {'for': 'less'}

"Plug 'dkprice/vim-easygrep'

Plug 'Valloric/YouCompleteMe'


Plug 'scrooloose/syntastic'

Plug 'bling/vim-airline'

Plug 'elzr/vim-json'
"vim-sneak Sneak is a minimalist, versatile Vim motion plugin that jumps to
"any location specified by two characters.
Plug 'justinmk/vim-sneak'

"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'kien/ctrlp.vim'

"Tagbar is a Vim plugin that provides an easy way to browse the tags of the
"current file and get an overview of its structure. 
Plug 'majutsushi/tagbar'

"vim signifiy It uses signs to indicate added, modified and removed lines based on data of
"an underlying version control system.
Plug 'mhinz/vim-signify'

" Git support
Plug 'tpope/vim-fugitive'

" " like <leader>w saves the current file
" Golang Lint etc
Plug 'fatih/vim-go', {'for': 'golang'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" Comment support
" <leader>c<space> Toggle
" <leader>cc Comment out
" <leader>cu Uncomment
Plug 'The-NERD-Commenter'
"Indent support
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-surround'

" Color Support
Plug 'tomasr/molokai'

" Color Support
Plug 'flazz/vim-colorschemes'
" Beautify JS
Plug 'pangloss/vim-javascript', {'for': ['html', 'js']}
Plug 'crusoexia/vim-javascript-lib', {'for': ['html', 'js']}
Plug 'maksimr/vim-jsbeautify', {'for': ['html', 'js']}
Plug 'othree/jspc.vim', {'for': ['html', 'js']}
Plug 'moll/vim-node', {'for': ['html', 'js']}
Plug 'ludovicchabant/vim-gutentags', {'for': ['html', 'js']}
Plug 'ramitos/jsctags', {'for': ['html', 'js']}
Plug 'osyo-manga/vim-watchdogs', {'for': ['html', 'js']}
Plug 'othree/jsdoc-syntax.vim', {'for': ['html', 'js']}
Plug 'heavenshell/vim-jsdoc', {'for': ['html', 'js']}
" Code completion for JS
Plug 'marijnh/tern_for_vim', {'for': ['html', 'js']}


" File/Folder Nav
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autopairs tool
Plug 'jiangmiao/auto-pairs'

" Silver Searcher SUpport
Plug 'rking/ag.vim'

" REact Snippets
Plug 'justinj/vim-react-snippets', {'for': 'js'}

" Emmet auto completion 
Plug 'mattn/emmet-vim', {'for': ['html', 'js']}
call plug#end()


set showcmd
"let mapleader = "<space>"
let g:ag_working_path_mode="r"
let g:sneak#streak = 1
let g:tagbar_autofocus = 1
" All of your Plugins must be added before the following line

"
" Autoformat setup
"
let g:autoformat_autoindent = 0
let g:formatterpath = ['~/vim/formatters']
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json 
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx 
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" for visual mode
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

"
"YouCompleteMe setup"
"
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 1
map ;;yc :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
"Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=W191,W291,W292,W293,W391,W503,W601,W602,W603,W604'
let g:syntastic_javascript_checkers = ['eslint']

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set ttimeoutlen=50

"
""UltiSnips setup"
"
let g:UltiSnipsExpandTrigger = ";;<tab>"
let g:ulti_expand_or_jump_res = 0
let g:ultisnips_python_style="doxygen"
function ExpandSnippetOrCarriageReturn()
	let snippet = UltiSnips#ExpandSnippetOrJump()
		if g:ulti_expand_or_jump_res > 0
			return snippet
		else
			return "\<CR>"
		endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsListSnippets="<c-L>"
let g:UltiSnipsEditSplit='vertical'

colorscheme molokai
syntax on
"let g:molokai_original = 1
let g:rehash256 = 1
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

"
filetype plugin indent on    " required



autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
set number

"
" beginsetup ctrlp and Silver Searcher setup

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  set grepprg=ag\ --nogroup\ --nocolor
  "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore ".git"'
  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches - so that appctrl will find application
" controller
"let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


" endsetup ctrlp

" Set to auto read when a file is changed from the outside
" set autoread

" 
" Set up leader
"
let mapleader = ","
let g:mapleader = ","
"
" " Fast saving
nmap <leader>w :w!<cr>

" 
" Height of the command bar
"
set cmdheight=2
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use spaces instead of tabs
" set expandtab
"
"" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" " Linebreak on 500 characters
set lbr
set tw=500


" Set easyvim to ag
let g:EasyGrepCommand=1      
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Tmux settings
"let g:tmuxify_custom_command = 'tmux split-window -d -l 10'
"let g:tmuxify_run = {'js':'node'}

" Autopep settings
"let g:autopep8_disable_show_diff=1

" Javascript settings
let g:jsdoc_enable_es6=1

" Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
map <leader>nn :Autopep8<cr>
map ;;t :tabedit<space>
map ;;l A
imap ;;l <Esc>A
imap ;;k <Esc>A<cr>
imap ;;j <Esc>}A<cr>
imap ;;u <Esc>:u<cr>
map ;;u :u<cr>
imap vv <Esc>
imap ;;w <Esc>:w!<cr>
map ;;w <Esc>:w!<cr>
imap ;;wq <Esc>:wq!<cr>
map ;;wq <Esc>:wq!<cr>
map ;;c :lclose<cr>
map <Leader>st :SyntasticToggleMode<cr>
map <Leader>ss :SyntasticToggleMode<cr>:w!<cr>
map <Leader>gc :Git commit -a -m "
map <Leader>gp :Git push<cr>
"map <Leader>sl :SlimuxREPLSendLine<CR>
"map <Leader>slb :SlimuxREPLSendBuffer<CR>
"vmap <Leader>sl :SlimuxREPLSendSelection<CR>
"map <Leader>sla :SlimuxShellLast<CR>
"map <Leader>slk :SlimuxSendKeysLast<CR>
" let g:user_emmet_leader_key='<Leader>e'
map <Leader>e <c-y>,
map ;;ag :Ag<space>
imap ;;ag :Ag<space>
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
"map ;;pu :!pythoscope %<cr>
map ;;s <Esc>^i
nmap <Leader>7 :TagbarToggle<CR>
map ,,a :Autoformat<CR>
map <Leader>N :bnext<CR>
map <Leader>B :bprevious<CR>

" <Leader>t - ,t mappings
map <Leader>td :TernDef<CR>
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/")"
nmap <Leader>tj :JsDoc<CR>
map <Leader>mm :set mouse=a<cr>
map <Leader>mo :set mouse=<cr>