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
Bundle 'ctrlpvim/ctrlp.vim'

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
 
" UltiSnips y vimSnippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

" Easymotion
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

" BufferGator
Bundle 'jeetsukumaran/vim-buffergator'

" NeoComplete
Bundle 'shougo/neocomplete.vim'

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

"set ignorecase
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
color hybrid_reverse

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

au FileType c,cpp,java,php,ruby,python,.vimrc,md,markdown,scala autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
 
" make sure vim returns to the same line once you reopen the file
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" ctags setup
set tags=./.tags,.tags,./tags,tags

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
let g:airline_theme='wombat'
" molokai, jellybeans, powerlineish, wombat, luna
let g:airline_powerline_fonts = 1
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
set guifont=Source\ Code\ Pro\ for\ Powerline:12

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
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_scala_checkers = ['ensime', 'scalac']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2

" vim-snippets && ultisnips
imap <Nul> <Space>
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CtrlP
map <Leader>e :CtrlPMRU<CR>
map <Leader><Leader>e :CtrlPBufTag<CR>
map <Leader><Leader><Leader>e :CtrlPTag<CR>
nmap ; :CtrlPBuffer<CR>

" remap default ctrlp setting to leader t
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_show_hidden=1
let g:ctrlp_mruf_max=500
  
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
  
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|idea|cache)$|tmp|temp',
  \ 'file': '\v\~$|\.(o|swp|class|pyc|wav|un~|mp3|ogg|blend|DS_Store)'
  \ }
  
let g:ctrlp_user_command={
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }
                                       
let g:ctrlp_reuse_window = 'startify'
                                          
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'mixed']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType scala setlocal omnifunc=scalacomplete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java = '\k\.\k*'
let g:neocomplete#force_omni_input_patterns.scala = '\k\.\k*'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


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

" Commenting the autocheck on save for the time being, might be worth to set
" it back, exploring for now
" autocmd BufWritePost *.scala :EnTypeCheck
nnoremap <LocalLeader>t :EnTypeCheck<CR>
nnoremap <C-B> :EnDeclarationSplit<CR>
nnoremap <LocalLeader><Space> :EnSuggestImport<CR>
nnoremap <C-F6> :EnRename<CR>
nnoremap <Leader><F1> :EnDocBrowse<CR>
nnoremap <Leader>p :EnInspectType<CR>
