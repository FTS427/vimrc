let mapleader = ','
set number  			" 显示行号
set relativenumber		" 显示相对行号
set incsearch           " 实时开启搜索高亮
set hlsearch			" 搜索结果高亮
set autoindent			" 自动缩进
set smartindent			" 智能缩进
set tabstop=4			" 设置tab制表符号所占宽度为4
set softtabstop=4		" 设置按tab时缩进宽度为4
set shiftwidth=4		" 设置自动缩进宽度为4
set expandtab			" 缩进时将tab制表服转为空格
set smartcase           " 开启智能大小写查找
set encoding=utf-8      " 使用UTF-8
set showcmd             " 显示命令输出
set clipboard=unnamedplus " 开启系统剪切板
set cursorline          " 高亮当前行
set ignorecase          " 设置忽略大小写
set smartcase           " 设置智能大小写
set ruler               " 设置显示当前位置
filetype on			" 开启文件类型检测
filetype plugin indent on  " 开启文件类型插件检测
syntax on 			" 开启语法高亮
vmap <C-c> "+y
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
set completeopt=preview,menu
set clipboard+=unnamed
set whichwrap+=<,>,h,l

" 插件
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-markdown'
Plug 'valloric/youcompleteme'
Plug 'yggdroot/indentline'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'valloric/youcompleteme'

call plug#end()

" markdown
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_autoscroll = 0 " 自动滚动到输入位置
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh','javascript','css','java','c']
let g:markdown_minlines = 100

" airline
let g:airline#extensions#tabline#enabled = 1                " 设置允许修改默认tab样式
let g:airline#extensions#tabline#formatter = 'jsformatter'  " 设置默认tab栏样式

" airline-theme
let g:airline_theme='angr'

" nerdtree
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>  " 设置nerdtree显示隐藏切换
let NERDTreeShowHidden=1                " 设置显示隐藏文件
" 设置忽略的文件
let NERDTreeIgnore=[                   
    \ '\.git$','\.svn$','\.DS_Store$'
    \ ]
" 如果NERDTree是唯一选项卡中剩下的唯一窗口，则退出Vim。
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" 如果NERDTree是其中唯一的窗口，则关闭该选项卡。
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

