" helps """"""""""""""""""""""""
" "u = undo, ctrl-r is redo
" "completion ctrl-p and -n for previous and next
" "y is yank (copy), yy is entire line
" "p is paste
" "/ forward search
" "? backward search
" "A jump to end and "append"
" "w jump to next word, W is with ignore punctuation
" "$ jump to end of line
" " . is replay
" " cw is change word and insert
"

syntax on
set tabstop=2
set shiftwidth=2
set expandtab "turn tabs to spaces
set cindent
set title
set showtabline=2
set background=dark
set autochdir
set smarttab
set number
set hlsearch "highlight search results
set incsearch "incremental search as you type
set ic! "ignore case for searching
set smartcase "ignores case until capital is used in search
set autoindent
set ruler "show ruler
set ff=unix

filetype plugin on "" if you want to load plugins
filetype indent on "" if you want autoindent to be on

set spell
set spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

highlight OverLength term=standout term=underline cterm=underline
match OverLength /\%81v.\+/

"map <F4> :sp %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
"map <C-s> :w<cr>
"imap <C-s> <ESC>:w<CR>a

"map <C-K> :pyf /usr/local/share/clang/clang-format.py<CR>
"imap <C-K> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i

"" strip trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+colorcolumn')
    set colorcolumn=81
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold and Completion Settings
set foldenable
set foldlevelstart=4
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
autocmd FileType cpp setlocal cindent
autocmd FileType cpp setlocal foldmethod=syntax foldlevel=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shell Scripts
" informs sh syntax that /bin/sh is actually bash
let is_bash=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TeX/LaTeX
" Disable annoying bad automatic indentation.
autocmd FileType tex setlocal indentexpr=

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


