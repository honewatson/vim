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
"set noshowmatch
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
" Linebreak on 500 characters
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
map <Leader>b <c-o>

let $plug_file = expand("~/.config/nvim/autoload/plug.vim")
let $plug_dir = expand('~/.config/nvim/plugged')

if filereadable($plug_file)
  set rtp+=$plug_file
  " :PlugAll
  call plug#begin($plug_dir)

  " Add back in TMUX
  Plug 'jebaum/vim-tmuxify'
  Plug 'christoomey/vim-tmux-navigator'
  " Kubernetes
  Plug 'andrewstuart/vim-kubernetes'
  Plug 'pearofducks/ansible-vim'
  " Autopairs tool
  Plug 'jiangmiao/auto-pairs'
  """ Syntax
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go'}
  Plug 'elzr/vim-json', {'for': ['json']}
  Plug 'godlygeek/tabular', {'for': ['md']}
  Plug 'plasticboy/vim-markdown', {'for': ['md']}
  Plug 'greyblake/vim-preview'
  Plug 'cespare/vim-toml', {'for': 'toml'}
  Plug 'rhysd/nyaovim-markdown-preview'
  Plug 'groenewege/vim-less', {'for': 'less'}
  Plug 'baabelfish/nvim-nim', {'for': 'nim'}
  Plug 'leafo/moonscript-vim', {'for': ['moonscript', 'moon']}
  Plug 'chaquotay/ftl-vim-syntax', {'for': 'freemarker'}
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
  Plug 'Rykka/riv.vim', {'for': 'reStructuredText'}
  Plug 'Rykka/InstantRst', {'for': 'reStructuredText'}
  Plug 'MTDL9/vim-log-highlighting'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'markdown',
    \ 'graphql',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
  " File/Folder Nav
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  "Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'honewatson/fzf.vim'
  """ Helpers
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'justinmk/vim-sneak'
  " Additional Indent support
  Plug 'tpope/vim-sleuth'
  " Emmet auto completion 
  Plug 'mattn/emmet-vim', {'for': ['moon', 'moonscript', 'html', 'javascript']}
  " Generate JSDOC
  Plug 'heavenshell/vim-jsdoc', {'for': ['html', 'javascript']}
  " Snippets
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'alexbyk/vim-ultisnips-js-testing', {'for': 'javascript'}
  " Autocomplete & Lint
  Plug 'w0rp/ale'
  Plug 'Valloric/YouCompleteMe', { 'do': 'npm install -g javascript-typescript-langserver && npm install -g yaml-language-server' }
  "Plug 'tenfyzhong/CompleteParameter.vim'
  "Plug 'zxqfl/tabnine-vim'
  " Use release branch
  "Plug 'othree/jspc.vim', {'for': ['html', 'javascript']}
  " Editor Visual
  Plug 'bling/vim-airline'
  "Tagbar is a Vim plugin that provides an easy way to browse the tags of the
  "current file and get an overview of its structure. 
  Plug 'majutsushi/tagbar'
  "vim signifiy It uses signs to indicate added, modified and removed lines based on data of
  "an underlying version control system.
  Plug 'mhinz/vim-signify'

  """ Version Control
  " Git support
  Plug 'tpope/vim-fugitive'
  call plug#end()
  " Javascript
  " Logs
  au BufNewFile,BufRead *.err set filetype=log
  au BufNewFile,BufRead *.out set filetype=log
  " Tmux
  let g:tmuxify_custom_command = 'tmux split-window -d -l 30'
  map <Leader>md ^v$<Leader>ms
  " Send line to vim command ,mv
  map <Leader>mv ^v$y:<C-R>0<BS><CR>
  
  " Syntax
  let g:typescript_indent_disable = 1
  let g:vim_markdown_fenced_languages = ['html', 'css', 'scss', 'sql', 'javascript', 'go', 'python', 'bash=sh', 'c', 'ruby', 'yaml', 'json', 'xml'] 
  au BufNewFile,BufRead *.nim set filetype=nim
  " Navigation
  let g:sneak#streak = 1
  let g:tagbar_autofocus = 1
  map <C-n> :NERDTreeToggle<CR>
  " Editor
  let g:airline#extensions#tabline#enabled = 1
  " Autocomplete
" always show signcolumns
  set signcolumn=yes
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

  let g:ycm_always_populate_location_list = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_filetype_blacklist={'unite': 1}
  let g:ycm_min_num_of_chars_for_completion = 1
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_language_server = 
    \ [ 
    \   {
    \     'name': 'yaml',
    \     'cmdline': [ expand('~/.npm/bin/yaml-language-server'), '--stdio' ],
    \     'filetypes': [ 'yaml' ]
    \   }
    \ ]
    " Not needed to get the good stuff.  Is this impacting gopls? Use vim-go or govim
    " Only do the ./install.py for ycm then use the lsp versions
    "\   {
    "\     'name': 'javascript',
    "\     'cmdline': [ expand('~/.npm/bin/javascript-typescript-stdio', '--stdio') ],
    "\     'filetypes': [ 'javascript' ]
    "\   }

  let g:jsdoc_enable_es6 = 1

  map <Leader>dd :YcmCompleter GoToDefinition<CR>
  map <Leader>dr :YcmCompleter GetDoc<CR>
  map <Leader>dv :YcmCompleter RefactorRename<space>
  map <Leader>df <c-p>
  map <Leader>dc /const <CR>w
  " Complete Parameter Plugin
  "let g:complete_parameter_use_ultisnips_mapping = 1
  "let g:complete_parameter_echo_signature = 1
  "inoremap <silent><expr> ( complete_parameter#pre_complete("()")
  "smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
  "imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
  "smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
  "imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
  " jsDoc
  map <Leader>dj :JsDoc<CR>
  " Version control
  map <Leader>gc :Git commit -a -m "
  map <Leader>gp :Git push<cr>
  map <Leader>e <c-y>,
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  " fzf
  map <c-p> :Files<CR>
  map <c-t> :Rg<space>
  " fzf files
  map <Leader>ff :Files<space>
  map <Leader>fr :Rg<space>
  map <Leader>fc :Commands<space>
  map <Leader>fl :Lines<CR>

  " Preview
  " nyaovim preview specifically
  map <Leader>vv :StartMarkdownPreview<CR>
  map <Leader>vn :StopMarkdownPreview<CR>
  "map <Leader>vb <Plug>(markdown-preview-scroll-bottom)
  "map <Leader>vt <Plug>(markdown-preview-scroll-top)
  "  call fzf#vim#grep("rg --column --line-number --no-heading --colors=match:fg:yellow --color=always --smart-case -e ".join(split(<q-args>), " -e "), 1, <bang>0)',
" command, with_column, [options]
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep("rg --column --line-number --no-heading --colors=match:fg:yellow --color=always --smart-case -e ".join(split(<q-args>), " -e "), 1,
    \	fzf#vim#with_preview(),
    \   <bang>0)

  " Likewise, Files command with preview window
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  " Fix files with prettier, and then ESLint.
  let b:ale_fixers = ['prettier']
  " Equivalent to the above.
  let b:ale_fixers = {'javascript': ['prettier']}  
  
  
endif
  
if !exists(':UltiSnipsEdit')
  " CTRL-P or CTRL-N are used
  "set completeopt=menu,preview
  "if exists('*completeopt#noselect')
    "completeopt+=noselect,noinsert
  "endif
  " Support for enter
  "inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  "inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  "inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
endif

" Added because mint intel graphics hardware driver autodims brightness and don't know how to fix
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none
"vim_markdown_folding_disabled 1


