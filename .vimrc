" ************* Vundle 配置 ****************
" 侦测文件类型 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle.vim : vim的一个非常好用的插件管理器
Bundle 'VundleVim/Vundle.vim'

" 更酷的启动界面
"Bundle 'mhinz/vim-startify'

" 协作编程
"Bundle 'FredKSchott/CoVim'

" 代码补全
Bundle 'shawncplus/phpcomplete.vim'              " PHP 代码补全，支持PHP7
Bundle 'Valloric/YouCompleteMe'                  " PYTHON 代码补全
Bundle 'SirVer/ultisnips'                        " PYTHON 代码补全
Bundle 'honza/vim-snippets'                      " PYTHON 代码补全

" 符号自动补全
Bundle 'Raimondi/delimitMate'

" 文件搜索
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/mru.vim'

" 静态语法检查
Bundle 'scrooloose/syntastic'
"Bundle 'vim-syntastic/syntastic'

" 代码浏览
Bundle 'majutsushi/tagbar'

" git支持
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" 美化主题
Bundle 'tomasr/molokai'
" Bundle 'morhetz/gruvbox'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'bling/vim-airline'
"Bundle 'vim-airline-themes'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'solarized'
"Bundle 'jpo/vim-railscasts-theme'
"Bundle 'altercation/vim-colors-solarized.git'
"Bundle 'fholgado/minibufexpl.vim'

" HTML & css 代码快速编写
Bundle 'vim-scripts/Emmet.vim'

" 模仿sublime text 的 ctrl + shift + f 在工程中全局查找某字符
" 需先安装ack: sudo apt-get install ack
Bundle 'dyng/ctrlsf.vim'

" 编辑增强
" 多光标操作
Bundle 'terryma/vim-multiple-cursors'

" 成对符号编辑
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" 快速注释
Bundle 'scrooloose/nerdcommenter'

" 自动对齐
Bundle 'godlygeek/tabular'

" 快速移动
Bundle 'Lokaltog/vim-easymotion'

" 代码块对齐用
Bundle 'Yggdroot/indentLine'

" 增强状态栏
Bundle 'rstatusline'

" tmux支持
Bundle 'benmills/vimux'

" c/c++
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/c.vim'

" org-mode
Bundle 'jceb/vim-orgmode'
Bundle 'tpope/vim-speeddating'

" markdown
Bundle 'plasticboy/vim-markdown'
" 可以通过浏览器实时预览，但是要安装额外依赖，详见官网
"Bundle 'suan/vim-instant-markdown'

" 网页开发
Bundle 'mattn/emmet-vim'

" pyhon
"Bundle 'klen/python-mode'
"Bundle 'python-imports.vim'

" js
Bundle 'coolwanglu/vim.js'

" golang
"Bundle 'fatih/vim-go'

" 用ack代替grep搜索
Bundle 'mileszs/ack.vim'
"bundle 'vimwiki/vimwiki'
"Bundle 'vim-scripts/bufexplorer.zip'
"Bundle 'terryma/vim-smooth-scroll'

call vundle#end()
filetype plugin on                                              " 载入文件类型插件
filetype indent on                                              " 为特定文件类型载入相关缩进文件


" *************** vim常用的基本设置 ***************

set nocp " 不与vi兼容
set number " 显示行号
set rnu                                                         " 显示相对行号

"设置编码，要放文件头
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312,latin1
language messages zh_CN.utf-8 "设置console提示的编码

" 语法高亮
syntax enable
syntax on

" 配色
"set t_Co=256
"set background=dark
"colorscheme molokai


" 显示换行符和tab
set list
set listchars=tab:▸\ ,eol:¬
"set list lcs=tab:\♠\ ,trail:•                                   " 显示tab键为♠，并且显示每行结尾的空格为'•'
" 一些备用字符:›┆┇┊┋♠♦•

" tab空格
set tabstop=4
set sts=4                                                       " 设置制表符宽度
set shiftwidth=4
set expandtab
set smarttab                                                    " 更加智能的tab键

" 映射命令到快捷键
map <F5> :!php %

set autoindent                                                  " 自动套用上一行的缩进方式
set smartindent                                                 " 智能缩进
set mouse=a                                                     " 开启鼠标支持
set laststatus=2                                                " 总是显示状态行
set backspace=indent,eol,start                                  " 对退格键提供更好的支持
set showmatch                                                   " 当光标移动到一个括号时高亮显示对应的另一个括号 <标配>
set showcmd                                                     " 回显输入的命令 <标配>
set showmode                                                    " 显示当前的模式 <标配>
set ruler                                                       " 在编辑过程中右下角显示光标的行列信息 <标配>
set wrap                                                        " 当一行文字很长时换行
set shortmess=atI                                               " 启动时不显示捐助乌干达儿童的提示 <感觉暂时没用>
set so=6                                                        " 上下滚行时空余6行 <不知道有什么用>
set ffs=unix,dos,mac                                            " 设置文件类型
set hlsearch                                                    " 高亮搜索内容 <标准>
set ignorecase                                                  " 搜索模式里忽略大小写
set smartcase                                                   " 如果搜索字符串里包含大写字母，则禁用 ignorecase
set incsearch                                                   " 显示搜索的动态匹配效果
set lazyredraw                                                  " 解决某些类型的文件由于syntax导致vim反应过慢的问题
set ttyfast                                                     " 平滑地变化
set cc=115                                                      " 第115字符处显示分隔符 <phpstorm默认的都是115>
set foldmethod=indent                                           " 折叠方式
set nofoldenable                                                " 不自动折叠
set foldcolumn=1                                                " 在行号前空出一列的宽度
set t_Co=256                                                    " 设置256真彩色
set history=1000                                                " 设置历史记录条数
"set autoread                                                   " 当文件在外部被修改时自动载入
"set cindent                                                    " 使用c语言的缩进格式
"set whichwrap+=<,>,h,l                                         " 允许backspace和光标键跨越行边界
"set cmdheight=2                                                " 显示两行命令行

" 格式化状态行显示的内容
set statusline=[%t]\ %y\ %m%=%{&fileencoding}\ [%{&ff}]\ [%l,\ %c]\ [%L]\ [%p%%]

" 打开一个文件自动定位到上一次退出的位置 <标配>
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"保存.vim文件后不用退出即可生效 <开发模式可以开启>
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
"au! bufwritepost .vimrc source %

" ************** 备份设置 ****************
"set nobackup                                                   " 不进行备份
"set nowb                                                       " 重新载入文件时不要备份
"set noswapfile                                                 " 不使用swf文件，可能导致错误无法恢复

" *************** 关闭错误声音 **************
set noerrorbells
set novisualbell
set t_vb=

" **************** 设置vim主题外观 ***************
"set background=light                                           " 设置vim背景为浅色
set background=dark                                             " 设置vim背景为深色
set cursorline                                                  " 突出显示当前行
set cursorcolumn                                                " 突出显示当前列

" molokai 主题
colorscheme molokai                                             " 设置molokai高亮主题
"let g:molokai_original = 1                                     " 原始的molokai背景颜色 
let g:rehash256 = 1                                             " 试图将256色版本尽可能接近默认的(dark)GUI版本 

" desert 主题
"colorscheme desert                                             " 设置desert高亮主题
"let g:solarized_termcolors=256

" solarized 主题
"colorscheme solarized                                          " 设置solarized高亮主题

" detorte 温和色主色
"colorscheme detorte                                            " 设置detorte高亮主题
"let g:detorte_theme_mode = 'dark'                              " 黑色主题，可以设置为light

" ************** vim插件的配色 **************
"hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE
"hi CursorColumn cterm=NONE ctermbg=237 ctermfg=NONE
hi vertsplit ctermbg=bg guibg=bg
hi GitGutterAdd ctermbg=bg guibg=bg
hi GitGutterChange ctermbg=bg guibg=bg
hi GitGutterDelete ctermbg=bg guibg=bg
hi GitGutterChangeDelete ctermbg=bg guibg=bg
hi SyntasticErrorSign ctermbg=bg guibg=bg
hi SyntasticWarningSign ctermbg=bg guibg=bg
hi FoldColumn ctermbg=bg guibg=bg

" *********** NERDTree插件配置 ***********
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=25                                          " 设置窗口宽度为25
let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭


" *********** ctags插件配置 ***********
set tags+=/usr/include/tags


" ********* cscope插件配置 **********
if has("cscope")
    "set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    set cscopequickfix=s-,c-,d-,i-,t-,e- "在quickfix窗口中显示搜索结果


    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif


" *********** nerdcommenter快速注释插件配置 **********
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" *********** syntastic插件配置 ***********
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚡'
"let g:syntastic_cpp_include_dirs = ['/usr/include/qt']
"let g:syntastic_cpp_compiler_options = '-std=gnu++11 -Wall'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
