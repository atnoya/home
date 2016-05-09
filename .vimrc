set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Bundle 'tpope/vim-fugitive'
" Useful programming helpers
Plugin 'L9'
" Useful for opening files
Bundle 'kien/ctrlp.vim'

Bundle 'derekprior/vim-colorpack'
Bundle 'flazz/vim-colorschemes'
" Syntax analisys
Bundle 'scrooloose/syntastic'

" Startup screen
Bundle 'mhinz/vim-startify'

" Tabs light and status
Bundle 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Color schema nice and clean
Bundle 'reedes/vim-colors-pencil'

" Automatic closing brackets, parenthesis...
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'

" Quickness tools
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'

Bundle 'godlygeek/tabular'
Bundle 'mhinz/vim-signify'
Bundle 'ekalinin/Dockerfile.vim'
 
" javascript
Bundle 'honza/vim-snippets'

Bundle 'Lokaltog/vim-easymotion'

" Easy clip
Bundle 'svermeulen/vim-easyclip'

" Tagbar
Bundle 'majutsushi/tagbar'

" Scala
Bundle 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'

" NERD
Bundle 'scrooloose/nerdtree.git'
"Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'jeetsukumaran/vim-buffergator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" required for vundle and go plugins and a nice settings to have.
filetype plugin indent on
syntax on
  
set mouse=a
   
" basic options
set encoding=utf-8
set fileformat=unix
set modelines=0
    
set backupdir=~/.cache/vim/,/tmp
set directory=~/.cache/vim/,/tmp
     
" indent stuff
set autoindent
set smartindent

" Setting system's clipboard
set clipboard=unnamed

set showmode
set showcmd
set hidden
        
" turning off bell signs
set noerrorbells
set visualbell

"set t_vb=
"autocmd VimEnter * set t_vb=

" Line number settings
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
nnoremap <C-n> :call NumberToggle()<CR>

" Others quick settings for easy editing
set cursorline
set ttyfast
set ruler
set backspace=eol,start,indent
set laststatus=2
set undofile
set history=10000
set undoreload=10000
set shell=/bin/zsh
set lazyredraw
set matchtime=3
set splitbelow splitright
set ttimeout
set notimeout
set autowrite autoread
set shiftround
set formatoptions=crql
set title
set foldmethod=marker
set dictionary=/usr/share/dict/words

set completeopt+=menuone
set completeopt-=preview

" wildmenu settings
set wildmenu
set wildmode=list:longest,full

set wildignore+=*/.hg/*,*/.git/*,*/.svn/*
set wildignore+=.pyc
set wildignore+=.class
set wildignore+=.jpg
set wildignore+=.png
set wildignore+=.gif
set wildignore+=.jar
set wildignore+=.swp
set wildignore+=*/build/*
set wildignore+=*/node_modules/*

" allows using the repeat operation with visual selection
vnoremap . :normal .<CR>

" tabs and spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set formatoptions=qrnl

" Setting mapleader
let mapleader="\\"
let maplocalleader="§"

" Autocomplete and complete
set complete=.,w,b,u,U,t,i,d

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
 
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
set virtualedit+=block

" Color settings
set t_Co=256
color jellybeans

"Use [RO] for [readonly]
set shortmess-=atI
set shortmess+=r
 
let xml_use_xhtml=1

" Tabs
noremap <Leader>t :badd<Space>
imap <Leader>t <Esc>:badd<Space>
imap <C-Left> <Esc>:bprev<CR>
map <C-Left> :bprev<CR>
imap <C-Right> <Esc>:bnext<CR>
map <C-Right> :bnext<CR>

" Windows
nnoremap <Leader>w :split 

" ==================================
" File types and custom autocommands
" ==================================

" Some file types user real tabs
au FileType {make,gitconfig} set noexpandtab sw=4

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json setf javascript
"  
" Make Python follow PEP8
au FileType python set sts=4 ts=4 sw=4 tw=79

" Make sure all markdown files have the correct filetype
au BufRead,BufNewFile *.md setf markdown
au BufRead,BufNewFile *.markdown setf markdown
  
au BufRead,BufNewFile *.dockerfile setf Dockerfile
   
" MultiMarkdown requires 4-space tabs
au FileType markdown set sts=4 ts=4 sw=4
     
" autoformat xml with xmllint and gg=G
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
      
" remove trailing whitespace on save and save cursor position
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"au FileType c,cpp,java,php,ruby,python,.vimrc,md,markdown,scala autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
 
" make sure vim returns to the same line once you reopen the file
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" startify
" custom indices
  
let g:startify_bookmarks = [
     \ '~/.vimrc',
     \ '~/.zshrc'
     \ ]

autocmd FileType startify setlocal nocursorline
                
let g:startify_skiplist = [
     \ 'COMMIT_EDITMSG',
     \ '^/tmp',
     \ '.*.un\~',
     \ '.+/MERGE_MSG$',
     \ '.+/COMMIT_EDITMSG$',
     \ $VIMRUNTIME .'/doc',
     \ 'bundle/.*/doc',
     \ '\.DS_Store'
     \ ]
" use F1 to start startify
:nmap <F1> :Startify<CR>

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='ubaryd'
let g:airline_powerline_fonts = 1
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
set guifont=Source\ Code\ Pro\ for\ Powerline:13

let g:Powerline_symbols = 'fancy'

set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

" syntastic
 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scala_checkers = ['scalac', 'ensime']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2

"let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CtrlP
map <Leader>e :CtrlPMRU<CR>
" nmap <Leader>r :CtrlP
nmap ; :CtrlPBuffer<CR>

" remap default ctrlp setting to leader t
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_show_hidden=1
let g:ctrlp_mruf_max=500
  
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
   
let g:ctrlp_mruf_exclude='/tmp/.*\|/temp/.*|~/.*'
let g:ctrlp_mruf_exclude+='/build/tmp/*'
let g:ctrlp_mruf_exclude+='.*.un~'
let g:ctrlp_mruf_exclude+='.cache*'
  
let g:ctrlp_user_command={
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }
                                       
let g:ctrlp_reuse_window = 'startify'
                                          
let g:ctrlp_custom_ignore ='\v\~$|\.(o|swp|class|pyc|wav|un~|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


" ============================
" TAGBAR
" ============================

nmap <F8> :TagbarToggle<CR>

let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "belowright"

" Ruby
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

" =====================================
" FUGITIVE
" =====================================

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>ge :Gedit<CR>
map <Leader>gl :Glog<CR>

" NERDTree

map <F2> :NERDTreeToggle<CR>

" ====================
" SCALA
" ====================

autocmd BufWritePost *.scala :EnTypeCheck
nnoremap <LocalLeader>t :EnTypeCheck<CR>
nnoremap <C-B> :EnDeclaration<CR>
nnoremap <LocalLeader><Space> :EnSuggestImport<CR>
nnoremap <C-F6> :EnRename<CR>
nnoremap <Leader><F1> :EnDocBrowse<CR>
nnoremap <Leader>p :EnInspectType<CR>
