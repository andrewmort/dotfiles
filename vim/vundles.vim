" -----------------------------------------------------------------------------
"
" Vundle Plugin Configuration
"
"     This file contains the list of plugin installed using vundle plugin
"     manager. Once you've updated the list of plugin, you can run vundle
"     update by issuing the command :BundleInstall from within vim.
"
" Brief Vundle Help
"  :PluginList       - lists configured plugins
"  :PluginInstall    - installs plugins
"  :PluginUpdate     - update plugins
"  :PluginSearch foo - searches for foo
"  :PluginClean      - confirms removal of unused plugins
"
" Note: Most of this configuration file is based on:
"  https://github.com/skwp/dotfiles/blob/master/vim/vundles.vim
"
" -----------------------------------------------------------------------------


" Filetype off is required by vundle
filetype off

" Add vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/vundles/

" Initialize bundles
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" -----------------------------------------------------------------------------
"  Appearance Bundles
" -----------------------------------------------------------------------------

" Add solarized plugin from github
Plugin 'altercation/Vim-colors-solarized'

" -----------------------------------------------------------------------------
"  Language Bundles
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
"  Git Bundles
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
"  Search Bundles
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
"  Project Bundles
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
"  Text Objects Bundles
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
"  Runtime Bundles
" -----------------------------------------------------------------------------


" All plugins must be defined before the following line
call vundle#end()

" Enable filetype plugin and indentation support
filetype plugin indent on
