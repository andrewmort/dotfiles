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

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" TODO: do I need these?
call add(g:pathogen_disabled, 'PushPop.vim')
call add(g:pathogen_disabled, 'ctrlp.vim')
call add(g:pathogen_disabled, 'detectindent')
call add(g:pathogen_disabled, 'indentLine')
call add(g:pathogen_disabled, 'tagbar')

" TODO: find plugin with less shell configuration
"call add(g:pathogen_disabled, 'vim-colors-solarized')

" TODO: rewrite this plugin
"call add(g:pathogen_disabled, 'gundo.vim')

" TODO: rewrite this plugin
"call add(g:pathogen_disabled, 'verilog_systemverilog.vim')

" TODO: try using built in explorer
call add(g:pathogen_disabled, 'nerdtree')

" TODO: do I need the perforce plugin?
call add(g:pathogen_disabled, 'perforce')
call add(g:pathogen_disabled, 'genutils')

" start the pathogen plugin
execute pathogen#infect()

" generate helptags for plugins
call pathogen#helptags()

" -----------------------------------------------------------------------------
" Display settings
" -----------------------------------------------------------------------------

" use utf-8 encoding
set encoding=utf-8

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
set t_vb=

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

" Function to set tab spacing
function! SetTabSpace(space)
  " Number of spaces a <Tab> in the file counts for
  let &tabstop=a:space

  " Number of spaces to use for each indent
  let &shiftwidth=a:space

  " Number of spaces a <Tab> counts for when editting
  let &softtabstop=a:space
endfunc

" expand all tabs out to spaces
set expandtab

" Set tab spacing
call SetTabSpace(2)

map <leader>t :call SetTabSpace(

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

" Function to toggle indenting settings
let b:myindent=1
function! ToggleIndent()
  if b:myindent
    let b:saveindentexpr=&l:indentexpr
    let b:saveautoindent=&l:autoindent
    let b:savecindent=&l:cindent
    let b:savesmartindent=&l:smartindent

    setlocal noautoindent
    setlocal nocindent
    setlocal nosmartindent
    setlocal indentexpr=""

    let b:myindent=0

    echo "ToggleIndent(): Auto indenting disabled"
  else
    let &l:indentexpr=b:saveindentexpr
    let &l:autoindent=b:saveautoindent
    let &l:cindent=b:savecindent
    let &l:smartindent=b:savesmartindent

    let b:myindent=1

    echo "ToggleIndent(): Auto indenting enabled"
  endif
endfunction

nmap <silent> <leader>i :call ToggleIndent()<CR>


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

" Get SHELL_COLOR variable from shell
let shell_color = $SHELL_COLOR
if shell_color == "SOLARIZED_DARK"
  set background=dark
  colorscheme solarized
  set t_Co=16

elseif shell_color == "SOLARIZED_LIGHT"
  set background=light
  colorscheme solarized
  set t_Co=16

elseif shell_color == "BLACK"
  set background=dark
  colorscheme default
  set t_Co=256

else
  set background=light
  colorscheme default
  set t_Co=256
endif



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
set wildmode=list:longest,full
"            |    |       |
"            |    |       +-- complete full match (second use of wildchar)
"            |    +---------- complete till longest common string
"            +--------------- list all matchs (first use of wildchar)

" always show status line even when editing single file
set laststatus=2


" Function to toggle rel vs. full path in statusline
let g:mystatus_relpath=1
function! ToggleStatus()
  set statusline=                               " clear statusline
  set statusline+=[%n]                          " buffer number

  if g:mystatus_relpath
    set statusline+=\ %<%F                      " full filename
    let g:mystatus_relpath=0
  else
    set statusline+=\ %<%f                      " relative filename
    let g:mystatus_relpath=1
  endif

  set statusline+=\ %h%m%r                      " help, modified, readonly
  set statusline+=%=                            " space
  set statusline+=\ %y                          " filetype
  set statusline+=\ \ \ %-14.(%l/%L,%c%V%)      " line/lines, column
  set statusline+=\ %P                          " percent of file
endfunction
call ToggleStatus()
nmap <silent> <leader>p :call ToggleStatus()<CR>


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

" delete white space at end of line
nmap <silent> <leader>dw :%s/\s\+$//e<CR>

" diff put/get/update
nmap <silent> <leader>dp :diffput<CR>
nmap <silent> <leader>dg :diffget<CR>
nmap <silent> <leader>du :diffupdate<CR>

" add remove directory for stack
if exists("loaded_pushpop")
  nmap <silent> <leader>pushd :pushd %:p:h<CR>:pwd<CR>
  nmap <silent> <leader>popd  :popd<CR>:pwd<CR>
else
  nmap <silent> <leader>pushd :cd %:p:h<CR>:pwd<CR>
  nmap <silent> <leader>popd  :cd -<CR>:pwd<CR>
endif

" map nerdtree plugin widnow to F3
nmap <F3> :NERDTreeToggle<CR>

" map undotree plugin window to F4
nmap <F4> :GundoToggle<cr>

" map spelling to F5
nmap <F5> :setlocal spell! spelllang=en_us<CR>

" map indent guides to F5
nmap <F6> :IndentLinesToggle<CR>

" disable by default
let g:indentLine_enabled = 0

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


" -----------------------------------------------------------------------------
" load local project settings from .local.vimrc
" -----------------------------------------------------------------------------

" search for and load localrc from / to current directory
call localrc#load('.local.vimrc','/',-1)
set t_BE=			" Prevent copy/paste problems after exiting vim


" -----------------------------------------------------------------------------
" Count word frequency
"   - From: http://vim.wikia.com/wiki/Word_frequency_statistics_for_a_file
"   - Usage
"     :WordFrequency
" -----------------------------------------------------------------------------
" Sorts numbers in ascending order.
" Examples:
" [2, 3, 1, 11, 2] --> [1, 2, 2, 3, 11]
" ['2', '1', '10','-1'] --> [-1, 1, 2, 10]
function! Sorted(list)
  " Make sure the list consists of numbers (and not strings)
  " This also ensures that the original list is not modified
  let nrs = ToNrs(a:list)
  let sortedList = sort(nrs, "NaturalOrder")
  echo sortedList
  return sortedList
endfunction

" Comparator function for natural ordering of numbers
function! NaturalOrder(firstNr, secondNr)
  if a:firstNr < a:secondNr
    return -1
  elseif a:firstNr > a:secondNr
    return 1
  else 
    return 0
  endif
endfunction

" Coerces every element of a list to a number. Returns a new list without
" modifying the original list.
function! ToNrs(list)
  let nrs = []
  for elem in a:list
    let nr = 0 + elem
    call add(nrs, nr)
  endfor
  return nrs
endfunction

function! WordFrequency() range
  " Words are separated by whitespace or punctuation characters
  let wordSeparators = '[[:blank:][:punct:]]\+'
  let allWords = split(join(getline(a:firstline, a:lastline)), wordSeparators)
  let wordToCount = {}
  for word in allWords
    let wordToCount[word] = get(wordToCount, word, 0) + 1
  endfor

  let countToWords = {}
  for [word,cnt] in items(wordToCount)
    let words = get(countToWords,cnt,"")
    " Append this word to the other words that occur as many times in the text
    let countToWords[cnt] = words . " " . word
  endfor

  " Create a new buffer to show the results in
  new
  setlocal buftype=nofile bufhidden=hide noswapfile tabstop=20

  " List of word counts in ascending order
  let sortedWordCounts = Sorted(keys(countToWords))

  call append("$", "count \t words")
  call append("$", "--------------------------")
  " Show the most frequent words first -> Descending order
  for cnt in reverse(sortedWordCounts)
    let words = countToWords[cnt]
    call append("$", cnt . "\t" . words)
  endfor
endfunction

command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
