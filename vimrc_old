imap jj <esc>
set ts=4
set ai
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set ruler

" -----------------------------------------------------------------------------
" Highlight column number 80
" -----------------------------------------------------------------------------
set colorcolumn=80
highlight ColorColumn ctermbg=black

" -----------------------------------------------------------------------------
" syntax, highlighting and spelling
" -----------------------------------------------------------------------------
syntax on
colorscheme desert
set background=dark

" -----------------------------------------------------------------------------
" moving around, searching, and patterns
" -----------------------------------------------------------------------------
set nostartofline    " keep cursor in same column for long-range motion cmds
set incsearch        " Highlight pattern matches as you type
set ignorecase       " ignore case when using a search pattern
set smartcase        " override 'ignorecase' when pattern has upper case char
set hlsearch         " Highlight all matches for pattern

" -----------------------------------------------------------------------------
" displaying text
" -----------------------------------------------------------------------------
set scrolloff=2         " number of screen lines to show around the cursor
set linebreak           " For lines longer than the window, wrap intelligently. 
                        " This doesn't insert hard line breaks.
set sidescrolloff=2     " min # of columns to keep left/right of cursor
set display+=lastline   " show last line, even if it doesn't fit in the window
set cmdheight=1         " # of lines for the command window


" -----------------------------------------------------------------------------
" status bar
" -----------------------------------------------------------------------------
set ruler      " display current cursor position in status bar

" -----------------------------------------------------------------------------
" no alerts on errors
" -----------------------------------------------------------------------------
set noerrorbells
set novisualbell
set timeoutlen=500

" -----------------------------------------------------------------------------
" editing text
" -----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything

" -----------------------------------------------------------------------------
" mouse support (normal mode)
" -----------------------------------------------------------------------------
if has('mouse')
   set mouse=a
endif

" -----------------------------------------------------------------------------
" clipboard support
" -----------------------------------------------------------------------------
set clipboard=unnamed

" -----------------------------------------------------------------------------
" spelling support
" -----------------------------------------------------------------------------
map <F5> :setlocal spell! spelllang=en_us<CR>

" -----------------------------------------------------------------------------
" restore old cursor position
" -----------------------------------------------------------------------------

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Allow persisted undo across sessions if available
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.vimrc source ~/.vimrc
