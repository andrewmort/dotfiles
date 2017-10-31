" Use Vim settings, rather than Vi settings
set nocompatible

" -----------------------------------------------------------------------------
" Pathogen Initialization (Plugin Management)
" -----------------------------------------------------------------------------

" Add the pathogen plugin to the vim runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim
"source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim

" Start the pathogen plugin
execute pathogen#infect()

" TODO move this
" Enable filetype plugin and indentation support
filetype plugin indent on

" -----------------------------------------------------------------------------
" Use Vundle to manage plugins
" -----------------------------------------------------------------------------

imap jk <esc>
set ts=3
set ai
set tabstop=3
set shiftwidth=3
set expandtab
set softtabstop=3
set smartindent
set ruler

" -----------------------------------------------------------------------------
" syntax, and colors
" -----------------------------------------------------------------------------
syntax on
au BufNewFile,BufRead *.v,*.vh,*.vt,*.sv set ft=verilog
au BufNewFile,BufRead *.use,*.sim,*.mod,*.inc,*.ckt,*.subckt set ft=adice
set background=dark
"colorscheme desert
"colorscheme solarized
set t_Co=16

" -----------------------------------------------------------------------------
" moving around, searching, and patterns
" -----------------------------------------------------------------------------
set nostartofline    " keep cursor in same column for long-range motion cmds
set incsearch        " Highlight pattern matches as you type
set ignorecase       " ignore case when using a search pattern
set smartcase        " override 'ignorecase' when pattern has upper case character

" -----------------------------------------------------------------------------
" displaying text
" -----------------------------------------------------------------------------
set scrolloff=2         " number of screen lines to show around the cursor
set linebreak           " For lines longer than the window, wrap intelligently. 
                        " This doesn't insert hard line breaks.
			" string to put before wrapped screen lines
set sidescrolloff=2     " min # of columns to keep left/right of cursor
set display+=lastline   " show last line, even if it doesn't fit in the window
set cmdheight=1         " # of lines for the command window


" -----------------------------------------------------------------------------
" status bar
" -----------------------------------------------------------------------------
set ruler      " display current cursor position in status bar
set showcmd    " display incomplete command in lower right corner"


" -----------------------------------------------------------------------------
" editing text
" -----------------------------------------------------------------------------
set backspace=indent,eol,start  "backspace over everything


" -----------------------------------------------------------------------------
" mouse support (normal mode)
" -----------------------------------------------------------------------------
if has('mouse')
   set mouse=n
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

