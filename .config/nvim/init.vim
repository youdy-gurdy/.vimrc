

" ============  General Config  ============ "


set number
set history=100              " store 100 :cmdline histories
set clipboard=unnamed        " MacOS clipboard sharing
set mouse=a
set ww=b,s,h,l,<,>,[,],~
set noswapfile
set hidden
"set cursorline               " highlight the current line
"set cursorcolumn            " highlight the current column
set visualbell               " use visual bell (no beeping)
set wildmode=list:longest    " cmdline completion
set showmatch                " matching bracket
"set virtualedit=onemore
"set laststatus=2            " status line
set splitright


" tab
set expandtab                " make tab input spaces instead
set tabstop=4                " show 4 spaces
set softtabstop=4            " input 4 spaces
set shiftwidth=4             " autoindent
set smartindent              " when starting a new line


" search
set ignorecase               " insensitive
set smartcase                " sensitive if expresson contains a capital letter
set incsearch                " incrementally
set wrapscan                 " cyclic
set hlsearch                 " highlight all search results

"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" memorize cursol position
augroup LastCursolPos
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

autocmd BufNewFile,BufRead *.tex  set filetype=tex
autocmd FileType tex inoremap ; \
autocmd FileType tex inoremap \ ;




"for vim
"filetype plugin indent on
"set fenc=utf-8
"set backspace=indent,eol,start
"set nobackup
"set showcmd    "Show incomplete cmds
"set autoread   "Reload files changed outside vim
"set wildmenu
"syntax enable
"set autoindent



" ============  Custom Commands and Keys  ============ "

let mapleader = ";"
inoremap <silent> jj <ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <Space><Space> zz


nnoremap j gj
nnoremap k gk

inoremap <silent> っj <ESC>
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy


" ============  dein  ============ "


let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let g:rc_dir    = expand('~/.config/nvim/dein')

    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    "call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})


    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")
call dein#recache_runtimepath()
