" hints """"""""""""""""""""""""
" "u = undo, ctrl-r is redo
" "completion ctrl-p and -n for previous and next
" "y is yank (copy), yy is entire line
" "p is put equivalent of paste
" "/ forward search
" "? backward search
" "A jump to end and "append"
" "w jump to next word, W is with ignore punctuation
" "$ jump to end of line
" "^ jump to start of line
" " . is replay
" " cw is change word and insert
"

syntax on
set tabstop=2
set shiftwidth=2
set expandtab "turn tabs to spaces
set title
set showtabline=2
set background=dark
set autochdir
" set smarttab
set number "turn on line numbers
set hlsearch "highlight search results
set incsearch "incremental search as you type
set ic! "ignore case for searching
set smartcase "ignores case until capital is used in search
" set autoindent
set ruler "show ruler
set ff=unix " unix line endings
set cursorline " highlight current line
set wildmenu "show wildcard menu for tab completes
set showmatch "show or highlight matching brackets

filetype plugin on "" if you want to load plugins
filetype indent off "" if you want autoindent to be on

set spell
set spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

highlight OverLength term=standout term=underline cterm=underline
match OverLength /\%121v.\+/

"map <F4> :sp %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
"map <C-s> :w<cr>
"imap <C-s> <ESC>:w<CR>a

"map <C-I> :py3f /opt/extern/externpro-18.04.1-gcc730-64-Linux/share/clang/clang-format.py<CR>
"imap <C-I> <c-o>:py3f /opt/extern/externpro-18.04.1-gcc730-64-Linux/share/clang/clang-format.py<CR>

function! Formatonsave()
    "let l:formatdiff = 1
    let l:lines="all"
    py3f /opt/extern/externpro-18.04.1-gcc730-64-Linux/share/clang/clang-format.py
endfunction
"autocmd BufWritePre *.h,*.c,*.cpp,*.hpp call Formatonsave()

"" strip trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+colorcolumn')
    set colorcolumn=121
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold and Completion Settings
set foldenable
set foldlevelstart=8
set foldopen=block,hor,jump,mark,percent,quickfix,search,tag,undo

" Make omnicompletion sane.
set completeopt=longest,menuone,preview

" Make the preview window go away when you exit insert mode.
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Email
" default formatoptions is tcq
autocmd FileType mail setlocal formatoptions=tcql
autocmd FileType mail setlocal textwidth=72
autocmd FileType mail setlocal iskeyword+=-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
autocmd FileType html setlocal formatoptions=ql
" turn off crazy html indenting
autocmd FileType html setlocal indentexpr=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
" Disable the strobe effect option:
let go_highlight_trailing_whitespace_error = 0
autocmd FileType go setlocal noet sw=8 sts=8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"
" Close foldlevels 1 and greater by default (jpythonfold.vim is in ftplugins)
autocmd FileType python setlocal foldlevel=1
autocmd BufNewFile *.py .! cat ~/.vim/skel.py

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++
autocmd FileType cpp,h,hpp setlocal cindent
autocmd FileType cpp,h,hpp setlocal foldmethod=syntax foldlevel=7
autocmd FileType c,cpp let b:comment_leader = '// '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim
autocmd FileType vim let b:comment_leader = '" '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shell Scripts
" informs sh syntax that /bin/sh is actually bash
let is_bash=1
autocmd FileType sh,python,ruby let b:comment_leader = '# '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TeX/LaTeX
" Disable annoying bad automatic indentation.
autocmd FileType tex setlocal indentexpr=
autocmd FileType tex let b:comment_leader = '% '

" vim: ts=8

if has('cscope')
  set cscopetag cscopeverbose
  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" set ,cc to comment the current line and ,cu to un comment per language
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

let mapleader="\<SPACE>"
nnoremap <leader>w :w<CR>

" https://github.com/LunarVim/LunarVim/blob/d002b0419a8621c5575c14119d0b8d9c4a7a44a0/vscode/settings.vim
if exists('g:vscode')
    " Better Navigation
    nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
    xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
    nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
    xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
    nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
    xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
    nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
    xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

    nmap <Tab> :Tabnext<CR>
    nmap <S-Tab> :Tabprev<CR>
endif

