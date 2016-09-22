set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'The-NERD-tree'                   "目录树显示插件
nmap <F5> :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'The-NERD-Commenter'              "快速注释插件
let g:NERDSpaceDelims = 1

Plugin 'ctrlp.vim'                       "文件查找插件
Plugin 'AutoClose'                       "自动添加匹配的右括号
Plugin 'Valloric/YouCompleteMe'          "目前最好用的自动补全插件
Plugin 'honza/vim-snippets'              "代码片段自动生成插件
Plugin 'Lokaltog/vim-easymotion'         "快速跳转/查找字符插件
Plugin 'junegunn/vim-easy-align'

"---------------alrLine Config--------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_exclude_filename = []
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=1
let Powerline_symbols='fancy'
let g:bufferline_echo=0
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

Plugin 'Yggdroot/indentLine'
map <F3> :IndentLinesToggle<CR>
map! <F3> <ESC>:IndentLinesToggle<CR>

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'

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

" Custom setting
syntax on
set nu
set ruler
set mouse=a
set hlsearch

set cursorline
set cursorcolumn
hi CursorLine term=bold cterm=NONE ctermbg=8 ctermfg=NONE guibg=Grey40
hi CursorColumn term=bold cterm=NONE ctermbg=8 ctermfg=NONE guibg=Grey40
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set backspace=2
set incsearch
set grepprg=grep\ -nH\ $*
set nocompatible
set encoding=utf-8
set foldmethod=manual "indent/marker/manual

" ============= Tab setting ==============================

" default setting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
let g:ts_val=4

function ToggleTabstop()
    if (g:ts_val==4)
      set expandtab
      set shiftwidth=2
      set tabstop=2
      set softtabstop=2
      let g:ts_val=2
      echo "tabstop = 2"
    else
      set expandtab
      set shiftwidth=4
      set tabstop=4
      set softtabstop=4
      let g:ts_val=4
      echo "tabstop = 4"
    endif
:endfunction
map <F4> :call ToggleTabstop()<CR>
map! <F4> <ESC>:call ToggleTabstop()<CR>

set cindent
set cinoptions=(0

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

" Removes trailing spaces and retab
" Trailing whitespace and tabs are forbidden, so highlight them.
highlight ForbiddenWhitespace ctermbg=lightcyan guibg=Grey40
match ForbiddenWhitespace /\s\+$\|\t/

" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

function TrimWhiteSpace()
   %s/\s*$//
   ''
   retab
:endfunction

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> <ESC>:call TrimWhiteSpace()<CR>
" ============= Tab setting end ==========================

" remenber last position
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

" code fold
set foldmethod=indent
set nofoldenable

" =================== tagbar setting =====================
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
" =================== tagbar setting end =================

" =================== cscope setting =====================
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" =================== cscope setting end =================
