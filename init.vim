  set nocompatible              " be iMproved, required
  filetype off                  " required
  "
  " For lustyExplorer
  "
  set hidden
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      " Do Mac stuff here  
      set rtp+=/Users/hwatson/.config/nvim/autoload/plug.vim
      call plug#begin('/Users/hwatson/.config/nvim/plugged')
  else
  endif

    set rtp+=/Users/hwatson/.config/nvim/autoload/plug.vim
    call plug#begin('~/.config/nvim/plugged')
  else

endif

Plug 'isRuslan/vim-es6'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'alexbyk/vim-ultisnips-js-testing', {'for': 'javascript'}

Plug 'Chiel92/vim-autoformat', {'for': ['html', 'css', 'javascript']}

Plug 'leafo/moonscript-vim', {'for': ['moonscript', 'moon']}
autocmd FileType moon setlocal shiftwidth=2 tabstop=2
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
"Plug 'Shougo/denite.nvim'

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

Plug 'reewr/vim-monokai-phoenix'
" Beautify JS

Plug 'othree/jspc.vim', {'for': ['html', 'javascript']}
Plug 'moll/vim-node', {'for': ['html', 'javascript']}
Plug 'ludovicchabant/vim-gutentags', {'for': ['html', 'javascript']}
Plug 'osyo-manga/vim-watchdogs', {'for': ['html', 'javascript']}
"Plug 'othree/jsdoc-syntax.vim', {'for': ['html', 'javascript']}
"Plug 'heavenshell/vim-jsdoc', {'for': ['html', 'javascript']}
" Code completion for JS
Plug 'marijnh/tern_for_vim', {'for': ['html', 'javascript']}

" Emmet auto completion 
Plug 'mattn/emmet-vim', {'for': ['moon', 'moonscript', 'html', 'javascript']}

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

" Reason support
"Plug 'reasonml-editor/vim-reason'

Plug 'The-NERD-Commenter'
"
"Indent support
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-surround'

" File/Folder Nav
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autopairs tool
Plug 'jiangmiao/auto-pairs'

" Silver Searcher SUpport
Plug 'rking/ag.vim'

call plug#end()


set showcmd
"let mapleader = "<space>"
let g:ag_working_path_mode="r"
let g:sneak#streak = 1
let g:tagbar_autofocus = 1
" All of your Plugins must be added before the following line

map <c-j> :YcmCompleter GetDoc<CR>
map <c-k> <c-w>z

"
"YouCompleteMe setup"
"
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 1
"map ;;yc :YcmCompleter GoToDefinitionElseDeclaration<CR>


"
"Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
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
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips', $HOME.'/vim/UltiSnips']
let g:UltiSnipsSnippetsDir=$HOME.'/vim/UltiSnips'
colorscheme monokai-phoenix
syntax on
filetype plugin indent on    " required
autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
set number
" beginsetup ctrlp and Silver Searcher setup

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  set grepprg=ag\ --nogroup\ --nocolor
  "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore ".git"'
  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
  let g:ctrlp_custom_ignore = 'node_modules\|\.git$\|\.hg$\|\.svn$'
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = 'node_modules\|\.git$\|\.hg$\|\.svn$'
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
"map ;;l A
"imap ;;l <Esc>A
"imap ;;k <Esc>A<cr>
"imap ;;j <Esc>}A<cr>
"imap ;;u <Esc>:u<cr>
"map ;;u :u<cr>
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
map <Leader>ds :CtrlPBufTag<cr>
map <Leader>dd :YcmCompleter GoToDefinition<CR>
map <Leader>df <c-p>
map <Leader>dc /const <CR>w
map <Leader>dv k?const <CR>w
map <Leader>b <c-o>
map <C-S-x> :Autoformat<CR>
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set cursorline
hi CursorLine cterm=NONE ctermbg=235
hi Visual cterm=NONE ctermbg=192 ctermfg=black

let g:vim_markdown_folding_disabled = 1

" Install ocaml, opam, and Merlin
" Make sure eval `opam config env` is in your zshrc or bashrc file
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
