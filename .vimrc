set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'epeli/slimux' 
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Git support
Plugin 'tpope/vim-fugitive'
Plugin 'tell-k/vim-autopep8'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
" Fast file navigation
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}"
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
"vim-airline Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
"Plugin 'edsono/vim-matchit'
Plugin 'elzr/vim-json'
Plugin 'honza/vim-snippets'
Plugin 'honza/dockerfile.vim'
Plugin 'chase/vim-ansible-yaml'
"vim-sneak Sneak is a minimalist, versatile Vim motion plugin that jumps to
"any location specified by two characters.
Plugin 'justinmk/vim-sneak'
"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'
"Mercurial
Plugin 'ludovicchabant/vim-lawrencium'
"Tagbar is a Vim plugin that provides an easy way to browse the tags of the
"current file and get an overview of its structure. 
Plugin 'majutsushi/tagbar'
"vim signifiy It uses signs to indicate added, modified and removed lines based on data of
"an underlying version control system.
Plugin 'mhinz/vim-signify'
Plugin 'plasticboy/vim-markdown'
"Plugin 'scrooloose/nerdcommentor'
"Gundo.vim is Vim plugin to visualize your Vim undo tree.
Plugin 'sjl/gundo.vim'
"Plugin 'tpope/vim-fugitive'"
"Indent support
Plugin 'tpope/vim-sleuth'
"Plugin 'tpope/vim-surround'
" openbrowser by uri
Plugin 'tyru/open-browser.vim'
"A plugin for c
"Plugin 'vim-scripts/a.vim'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
"PEP8 Support
Plugin 'nvie/vim-flake8'
"
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'marijnh/tern_for_vim'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
"use sneak Plugin 'easymotion/vim-easymotion' 
set showcmd
"let mapleader = "<space>"
let g:ag_working_path_mode="r"
let g:sneak#streak = 1
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" All of your Plugins must be added before the following line
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr> 
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"YouCompleteMe setup"
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist={'unite': 1}
let g:ycm_min_num_of_chars_for_completion = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set ttimeoutlen=50
""UltiSnips setup"
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

"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"let g:user_emmet_leader_key='<C-Z>'
""EasyMotion"
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)

colorscheme molokai
"let g:molokai_original = 1
let g:rehash256 = 1

"
call vundle#end()            " required
filetype plugin indent on    " required
 
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
set number
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
let g:ctrlp_use_caching = 0
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor

	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
	let g:ctrlp_prompt_mappings = {
		\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
		\ }
endif
" Set to auto read when a file is changed from the outside
" set autoread
"
" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"
" " Fast saving
nmap <leader>w :w!<cr>

" Height of the command bar
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

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/")"
map <leader>nn :Autopep8<cr>
let g:autopep8_disable_show_diff=1
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
map <Leader>sl :SlimuxREPLSendLine<CR>
map <Leader>slb :SlimuxREPLSendBuffer<CR>
vmap <Leader>sl :SlimuxREPLSendSelection<CR>
map <Leader>sla :SlimuxShellLast<CR>
map <Leader>slk :SlimuxSendKeysLast<CR>
let g:user_emmet_leader_key=';;'
map ;;ag :Ag<space>
imap ;;ag :Ag<space>
map ;;q :q!<cr>
map ,c :!
noremap ;;a <esc>ggVG<CR>
map ;;v :!cat ~/.vimrc<cr>
map ;;vo :tabedit ~/vim/.vimrc<cr>
