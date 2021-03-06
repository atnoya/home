"set the runtime path to include Vundle and initialize
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'

Plug 'derekprior/vim-colorpack'
Plug 'flazz/vim-colorschemes'
" Syntax analisys
" Neomake should be faster but it doesn't currently work with ensime
" Plug 'neomake/neomake'
Plug 'scrooloose/syntastic'

" Startup screen
Plug 'mhinz/vim-startify'

" Tabs light and status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schema nice and clean
Plug 'reedes/vim-colors-pencil'

" Automatic closing brackets, parenthesis...
Plug 'Raimondi/delimitMate'

" Adding text targets
Plug 'wellle/targets.vim'

" Quickness tools
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'terryma/vim-expand-region'
Plug 'rking/ag.vim'

Plug 'mhinz/vim-signify'
Plug 'ekalinin/Dockerfile.vim'

" UltiSnips y vimSnippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Easymotion
Plug 'Lokaltog/vim-easymotion'

" Easy clip
Plug 'svermeulen/vim-easyclip'

" Tagbar
Plug 'majutsushi/tagbar'

" Scala
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

" LSP
Plug 'Shougo/echodoc.vim'

Plug 'rizzatti/dash.vim'
" NERD
Plug 'scrooloose/nerdtree'

" BufferGator
Plug 'jeetsukumaran/vim-buffergator'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" File icons
Plug 'ryanoasis/vim-devicons'

" Disabled as it conflicts with coc
" " Deoplete for neovim
" function! DoRemote(arg)
"   UpdateRemotePlugins
" endfunction
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/echodoc.vim'

" Other plugins
" Plug 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call plug#end()            " required

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
set ruler
set backspace=eol,start,indent
set laststatus=2
set undofile
set history=10000
set undoreload=10000
set shell=/bin/zsh
set lazyredraw
set matchtime=3
set nostartofline
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
set completeopt+=preview
set completeopt+=noinsert

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
set wildignore+=*/target/*

" allows using the repeat operation with visual selection
vnoremap . :normal .<CR>

" tabs and spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set formatoptions=qrnl

" Setting mapleader
let mapleader="\<space>"
let maplocalleader="\\"

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
set noshowmode

" Color settings
color gruvbox
set t_Co=256

" Search highlight settings
hi Search ctermfg=white ctermbg=darkblue

"Use [RO] for [readonly]
set shortmess-=atI
set shortmess+=r
 
let xml_use_xhtml=1

" Ctags will promtp in case of multiple matching
set cscopetag

" Stop the annoying window popping up when pressing q:
map q: :q

" Allows for inserting a new line without entering insert mode using CR for
" new line and Shift + CR for a new line above
nmap <S-CR> O<Esc>j
nmap <CR> o<Esc>

" ==================================
" Tabs
" ==================================
noremap <Leader>t :badd<Space>
imap <C-Left> <Esc>:bprev<CR>
noremap <C-Left> :bprev<CR>
imap <C-Right> <Esc>:bnext<CR>
noremap <C-Right> :bnext<CR>

" ==================================
" Windows
" ==================================
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
au FileType json syntax match Comment +\/\/.\+$+
 
" ctags setup
set tags=./.tags;/,.tags;/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='wombat'
" molokai, jellybeans, powerlineish, wombat, luna
let g:airline_powerline_fonts = 1
let g:airline_enable_branch     = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
" set guifont=Source\ Code\ Pro\ for\ Powerline:12
" set guifont=Hack:12
set guifont=Fira\ Code:12

let g:Powerline_symbols = 'fancy'

set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_scala_checkers = ['ensime']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0
let g:syntastic_full_redraws=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_shell = "/bin/sh"
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-snippets && ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:build_buffer_list()
  call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '30%'})
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

map <silent> <Leader>\ :FZF<CR>
map <silent> <Leader><Leader>b :Buffers<CR>
map <silent> <Leader><Leader>h :History<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete (Disabled as it conflicts with COC)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call deoplete#enable()
" call deoplete#custom#option({
"       \ 'camel_case': v:true,
"       \ 'smart_case': v:true,
"       \ 'sources': {
"         \ '_': ['buffer', 'member', 'file', 'tag', 'omni', 'ultisnips']
"       \ }
"     \ })

" " Plugin key-mappings.
" " <TAB>: completion.
" " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" inoremap <expr><C-g>     deoplete#undo_completion()
" inoremap <expr><C-l>     deoplete#complete_common_string()

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

" " function! s:my_cr_function()
" "   return pumvisible() ? "\<C-y>" : "\<CR>"
" " endfunction

" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#close_popup()."\<C-h>"

" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" " autocmd FileType scala setlocal omnifunc=scalacomplete#CompleteTags
" autocmd FileType scala set omnifunc=LanguageClient#complete
" " au filetype {java,scala} setlocal omnifunc=javacomplete#Complete
" " au filetype scala set omnifunc=EnCompleteFunc

" ============================
" TAGBAR
" ============================

nmap <F8> :TagbarOpenAutoClose<CR>

let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "belowright"

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F2> :NERDTreeToggle<CR>

" ====================
" Expand Region
" ====================
map <C-j> <Plug>(expand_region_expand)
map <C-k> <Plug>(expand_region_shrink)

let g:expand_region_use_select_mode = 1

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'ib'  :1, 
      \ 'i]'  :1,
      \ 'iB'  :1,
      \ 'il'  :0, 
      \ 'ip'  :0,
      \ 'ie'  :0, 
      \ }
let g:expand_region_text_objects_scala = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'ia'  :1,
      \ 'ib'  :1, 
      \ 'ab'  :1, 
      \ 'i]'  :1,
      \ 'a]'  :1,
      \ 'iB'  :1,
      \ 'aB'  :1,
      \ 'im'  :1, 
      \ 'am'  :1,
      \ 'il'  :0, 
      \ 'ip'  :1,
      \ 'ie'  :0, 
      \ }

call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 0, 
      \ 'a]' :1, 
      \ 'ab' :1, 
      \ 'aB' :1, 
      \ 'ii' :0, 
      \ 'ai' :0, 
      \ })

" ======================
" Markdown
" ======================

let g:vim_markdown_folding_level = 3

" ======================
" Dash
" ======================
:nmap <silent> <leader>d <Plug>DashSearch

" ======================
" COC
" ======================
" Configuration for coc.nvim
"
set hidden

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
xmap <leader>a  <Plug>(coc-codeaction-line)
nmap <leader>a  <Plug>(coc-codeaction-line)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
