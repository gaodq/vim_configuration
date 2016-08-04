" Custom setting
syntax on
set nu
set ruler
set mouse=a
set hlsearch
set cursorline
set backspace=2
set incsearch
set grepprg=grep\ -nH\ $*
set nocompatible
set encoding=utf-8
set foldmethod=manual "indent/marker/manual

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'The-NERD-tree'                   "目录树显示插件
" scrooloose/nerdtree
nmap <F5> :NERDTreeToggle<cr>

Plugin 'The-NERD-Commenter'              "快速注释插件
Plugin 'ctrlp.vim'                       "文件查找插件
Plugin 'AutoClose'                       "自动添加匹配的右括号
Plugin 'Valloric/YouCompleteMe'          "目前最好用的自动补全插件
Plugin 'honza/vim-snippets'              "代码片段自动生成插件
Plugin 'Lokaltog/vim-easymotion'         "快速跳转/查找字符插件
Plugin 'nathanaelkane/vim-indent-guides' "快速跳转/查找字符插件
Plugin 'junegunn/vim-easy-align'

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

" Tab setting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set cindent
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

" Removes trailing spaces and retab
function TrimWhiteSpace()
   %s/\s*$//
   ''
   retab
:endfunction

" set list listchars=trail:.,extends:>
" autocmd FileWritePre * :call TrimWhiteSpace()
" autocmd FileAppendPre * :call TrimWhiteSpace()
" autocmd FilterWritePre * :call TrimWhiteSpace()
" autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
