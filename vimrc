" -----------------------------------------------------------------------------
"  File: .vimrc
"  Author: Andrew Mort (andrewnmort@gmail.com)
"
"  TODO Delete history and swap files when old?
"  TODO Undo plugin
" -----------------------------------------------------------------------------

" use Vim settings, rather than Vi settings
set nocompatible


" -----------------------------------------------------------------------------
" Pathogen Initialization (Plugin Management)
" -----------------------------------------------------------------------------

" add the pathogen plugin to the vim runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim

" start the pathogen plugin
execute pathogen#infect()

" generate helptags for plugins
call pathogen#helptags()

" -----------------------------------------------------------------------------
" Display settings
" -----------------------------------------------------------------------------

" start scrolling 2 lines before horizontal window border
set scrolloff=2

" wrap text at the end of lines
set wrap

" wrap only at characters in the breakat option
set linebreak

" disable linebreak when end of line is hit
set nolist
set textwidth=0

" include as much of the last line as possible when it wraps
set display+=lastline 

" show invisible characters
set listchars=tab:>-,trail:·,eol:¬
set list

" Change terminal's title
set title

" don't beep
set visualbell
set noerrorbells

" highlight current line
set cursorline

" enable relative line numbers
set number relativenumber

" Set focused buffer to use relative and absolute numbers
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

" Function to toggle line number style
function! ToggleNuMode()
  if(&relativenumber == 1)
    set number norelativenumber
  else
    set number relativenumber
  endif
endfunc

map <silent> <C-n> :call ToggleNuMode()<CR>

" -----------------------------------------------------------------------------
" Tab settings
" -----------------------------------------------------------------------------

" expand all tabs out to spaces
set expandtab

" set tabstop to 2
set tabstop=2

" set shiftwidth to 2 (used with > indent commands)
set shiftwidth=2

" number of spaces represented by a tab
set softtabstop=2


" -----------------------------------------------------------------------------
" Editing text
" -----------------------------------------------------------------------------

" map jk to escape
imap jk <esc>

"backspace over everything
set backspace=indent,eol,start

" delete comment character when joining commented lines
set formatoptions+=j

" enable autoindent
set autoindent


" -----------------------------------------------------------------------------
" Moving around, searching, and patterns
" -----------------------------------------------------------------------------

" keep cursor in same column for long-range motion cmds
set nostartofline

" Highlight pattern matches as you type
set incsearch

" Highlight search by default
set hlsearch

" ignore case when using a search pattern
set ignorecase

" override 'ignorecase' when pattern has upper case character
set smartcase

" use <C-L> to clear highlighting
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" allow cursor to always move to next line even if a line is wrapped
nnoremap j gj
nnoremap k gk

" Enable support for % to jump between matching keywords (e.g. being:end)
runtime macros/matchit.vim


" -----------------------------------------------------------------------------
" Color Settings
" -----------------------------------------------------------------------------

" use dark background
set background=dark

" use solarized colorscheme
colorscheme solarized

" set number of colors for solarized to work correctly
set t_Co=16


" -----------------------------------------------------------------------------
" Filetype settings
" -----------------------------------------------------------------------------

" enable filetype plugin and indentation support
filetype plugin indent on

" enable sytax highlighting
syntax on

" map extensions to filetypes
au BufNewFile,BufRead *.vt set ft=verilog_systemverilog
au BufNewFile,BufRead *.use,*.sim,*.mod,*.inc,*.ckt,*.subckt set ft=adice


" -----------------------------------------------------------------------------
" Map emacs-style editting on the command line
" -----------------------------------------------------------------------------

" start of line
cnoremap <C-A>          <Home>
" back one character
cnoremap <C-B>          <Left>
" delete character under cursor
cnoremap <C-D>          <Del>
" end of line
cnoremap <C-E>          <End>
" forward one character
cnoremap <C-F>          <Right>
" recall newer command-line
cnoremap <C-N>          <Down>
" recall previous (older) command-line
cnoremap <C-P>          <Up>
" back one word
cnoremap <Esc><C-B>     <S-Left>
" forward one word
cnoremap <Esc><C-F>     <S-Right>


" -----------------------------------------------------------------------------
" Status/command bar
" -----------------------------------------------------------------------------

" display current cursor position in status bar
set ruler

" display incomplete command in lower right corner"
set showcmd

" # of lines for the command window
set cmdheight=1

" Enable enhanced command-line completion
set wildmenu

" always show status line even when editing single file
set laststatus=2


" -----------------------------------------------------------------------------
" Swap/Backup/Undo/Viminfo settings
" -----------------------------------------------------------------------------

" Tell vim to remember certain things when we exit
"  '50  :  marks will be remembered for up to 50 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :100 :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='50,\"100,:100,%,n~/.viminfo

" remember search history and commands
set history=1000

" remember many levels of undo
set undolevels=1000

" set persistent undo
set undofile

" set undo directory (// includes filepath in name)
set undodir=~/.vim/undo//

" set backup directory (// includes filepath in name)
set backupdir=~/.vim/backup//

" set swp directory (// includes filepath in name)
set directory=~/.vim/swp//


" -----------------------------------------------------------------------------
" Miscellaneous settings
" -----------------------------------------------------------------------------

" use normal mouse mode
if has('mouse')
   set mouse=n
endif

" use system clipboard
set clipboard=unnamed

" map \ev to edit vimrc
nmap <silent> <leader>ev :split $MYVIMRC<CR>

" map \sv to source vimrc
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" map nerdtree plugin widnow to F3
map <F3> :NERDTreeToggle<CR>

" map undotree plugin window to F4
nnoremap <F4> :GundoToggle<cr>

" map spelling to F5
nmap <F5> :setlocal spell! spelllang=en_us<CR>

" map tagbar plugin window to F9
nmap <F9> :TagbarToggle<CR>


" -----------------------------------------------------------------------------
" restore old cursor position
" -----------------------------------------------------------------------------

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



