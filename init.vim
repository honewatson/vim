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

"Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
"Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'alexbyk/vim-ultisnips-js-testing', {'for': 'javascript'}

Plug 'Chiel92/vim-autoformat', {'for': ['html', 'css']}

Plug 'leafo/moonscript-vim', {'for': ['moonscript', 'moon']}
autocmd FileType moon setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType md setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType sh setlocal shiftwidth=2 tabstop=2
"Plug 'dkprice/vim-easygrep'
"
Plug 'jakwings/vim-pony', {'for': ['pony']}

Plug 'Valloric/YouCompleteMe'

"Plug 'scrooloose/syntastic'

Plug 'w0rp/ale'

Plug 'bling/vim-airline'

Plug 'elzr/vim-json', {'for': ['json']}
"vim-sneak Sneak is a minimalist, versatile Vim motion plugin that jumps to
"any location specified by two characters.
Plug 'justinmk/vim-sneak'

"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"Plug 'kien/ctrlp.vim'
"Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
Plug 'plasticboy/vim-markdown'

Plug 'reewr/vim-monokai-phoenix'
" Beautify JS

" Auto provides parameters of functions
Plug 'othree/jspc.vim', {'for': ['html', 'javascript']}
"Plug 'moll/vim-node', {'for': ['html', 'javascript']}
" Regenerates tags files async
Plug 'ludovicchabant/vim-gutentags', {'for': ['html', 'javascript']}
" Async syntax highlighing
Plug 'osyo-manga/vim-watchdogs', {'for': ['html', 'javascript']}
"Plug 'othree/jsdoc-syntax.vim', {'for': ['html', 'javascript']}
" Generate JSDOC
Plug 'heavenshell/vim-jsdoc', {'for': ['html', 'javascript']}
" Code completion for JS
"Plug 'marijnh/tern_for_vim', {'for': ['html', 'javascript']}

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
" Turn off folds with 'set nofoldenable' and toggle with 'zi'
" Less Lint
Plug 'groenewege/vim-less', {'for': 'less'}

" Reason support
"Plug 'reasonml-editor/vim-reason'


Plug 'scrooloose/nerdcommenter'
"iPlug 'scrooloose/nerdcommenter'
"
"Indent support
Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-surround'

" File/Folder Nav
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autopairs tool
Plug 'jiangmiao/auto-pairs'
"Plug 'rstacruz/vim-closer'
"Plug 'Raimondi/delimitMate'

" Silver Searcher SUpport
Plug 'rking/ag.vim'

" Add back in TMUX
Plug 'jebaum/vim-tmuxify'
Plug 'christoomey/vim-tmux-navigator'

" Kubernetes
Plug 'andrewstuart/vim-kubernetes'

call plug#end()

set nofoldenable

" Typescript/typescript
let g:typescript_indent_disable = 1

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

"if executable('rg')
  "set grepprg=rg\ --color=never
  "let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  "let g:ctrlp_custom_ignore = 'node_modules'
  "let g:ctrlp_use_caching = 0
"endif

set wildignore+=*/.git/*,*/.hg/*,*/tmp/*,*.swp



" Default to filename searches - so that appctrl will find application
" controller
"let g:ctrlp_by_filename = 1
" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0


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
set shiftwidth=2
set tabstop=2

" " Linebreak on 500 characters
set lbr
set tw=500


" Set easyvim to ag
let g:EasyGrepCommand=1      
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Tmux settings
let g:tmuxify_custom_command = 'tmux split-window -d -l 30'
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
nmap <Leader>7false :TagbarToggle<CR>
map ,,a :Autoformat<CR>
map <Leader>N :bnext<CR>
map <Leader>B :bprevious<CR>

" <Leader>t - ,t mappings
"map <Leader>td :TernDef<CR>
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/")"
nmap <Leader>tj :JsDoc<CR>
map <Leader>mm :set mouse=a<cr>
map <Leader>mo :set mouse=<cr>
map <Leader>ds :CtrlPBufTag<cr>
map <Leader>dd :YcmCompleter GoToDefinition<CR>
map <Leader>dv :YcmCompleter RefactorRename<space>
map <Leader>df <c-p>
map <Leader>dc /const <CR>w
"map <Leader>dv k?const <CR>w
map <Leader>b <c-o>
map <C-S-x> :Autoformat<CR>
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set cursorline
hi CursorLine cterm=NONE ctermbg=235
hi Visual cterm=NONE ctermbg=192 ctermfg=black
" fzf
map <c-p> :Files<CR>
map <c-t> :Rg<space>
" fzf files
map <Leader>ff :Files<CR>
map <Leader>fr :Rg<CR>
map <Leader>fc :Commands<CR>
map <Leader>fl :Lines<CR>
let g:vim_markdown_folding_disabled = 1
function! MyHighlights() abort
    hi MatchParen guifg=#111111 guibg=#E6DB74 gui=NONE ctermfg=15 ctermbg=197 cterm=NONE
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme monokai-phoenix
let g:vim_markdown_fenced_languages = ['html', 'css', 'scss', 'sql', 'javascript', 'go', 'python', 'bash=sh', 'c', 'ruby'] 
" Follow link -> ge
"
"
" " Install ocaml, opam, and Merlin
" Make sure eval `opam config env` is in your zshrc or bashrc file
