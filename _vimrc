" Vundle: Plugin manager

filetype off
set shellslash
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'preservim/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wikitopian/hardmode'
Plugin 'gabrielelana/vim-markdown'
" Plugin 'tyru/open-browser.vim'
Plugin 'previm/previm'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'itchyny/lightline.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" My Configs

syntax enable
set nu
colorscheme potato
"set guifont=Consolas:h14
set guifont=Cascadia_Mono_PL:h14:cANSI:qDRAFT "Cascadia_Mono_PL:h14:cANSI:qDRAFT
set backspace=indent,eol,start
set cursorline
"set cursorcolumn
set ruler
set hlsearch
set incsearch
hi Search ctermfg=53 ctermbg=220 gui=bold guifg=#4C3736 guibg=#FFE737
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set langmenu=zh_TW.UTF-8
set fileencoding=utf-8
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
"hi Search cterm=reverse ctermbg=none ctermfg=none
" statusline
"set laststatus=2
"let g:currentmode={'n':'Normal','v':'Visual','V':'V-Line','^V':'V-Bolck','i':'Insert','R':'Replace','Rv':'V-Replace','C':'Command'}
"set statusline=%M[%n]\ %f\ [%{&fileencoding}]%=[%{&encoding}]\ [%l/%L\ %p%%]\ %-03c
"set statusline=%M[%n][%{&fileencoding}]\ %f\ %=[%{&encoding}]\ [%c,%l/%L\ %p%%]

" previm
" https://github.com/previm/previm
" note:
" make sure to edit vimfiles\bundle\previm\autoload\previm.vim
" modify the following line:
"     if has('win32') && g:previm_open_cmd =~? 'firefox'
" By default, the author assume you are using firefox on Windows.
" As a result, directory separator is converted to '\' only when your
" previm_open_cmd contains the keyword 'firefox'.
" Change it to to the browser you're using or remove the pattern match
" condition if you don't use cygin on your machine.

let g:previm_open_cmd = 'start "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe"' 

" air-line
" https://github.com/vim-airline/vim-airline

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"disable error sounds in windows

if has("gui_running")
    autocmd GUIEnter * set vb t_vb=
endif

" for reference

"set nocase
"set ignorecase
"set smartcase
"set cindent
"set confirm
"https://magiclen.org/vimrc/
"set t_Co=256
"source ~/vimfiles/colors/potato.vim
"set guifont=Lucida_Console:h10

" Custom command: example

command ShowCurrentWord echo expand('<cword>')

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.

if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg1 = substitute(arg1, '!', '\!', 'g')
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg2 = substitute(arg2, '!', '\!', 'g')
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let arg3 = substitute(arg3, '!', '\!', 'g')
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        if empty(&shellxquote)
          let l:shxq_sav = ''
          set shellxquote&
        endif
        let cmd = '"' . $VIMRUNTIME . '\diff"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    let cmd = substitute(cmd, '!', '\!', 'g')
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
      let &shellxquote=l:shxq_sav
    endif
endfunction
