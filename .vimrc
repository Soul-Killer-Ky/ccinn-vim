filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle.vim : vim的一个非常好用的插件管理器
Bundle 'VundleVim/Vundle.vim'

" 美化主题
Bundle 'tomasr/molokai'

" 目录
Bundle 'scrooloose/nerdtree'

" PHP代码补全
Bundle 'shawncplus/phpcomplete.vim'

" 符号自动补全
Bundle 'Raimondi/delimitMate'

" 代码块对齐用
Bundle 'Yggdroot/indentLine'

" 静态语法检查
Bundle 'vim-syntastic/syntastic'

" 快速注释
Bundle 'scrooloose/nerdcommenter'

" PSR 格式化
Bundle 'stephpy/vim-php-cs-fixer'

" 模仿sublime text 的 ctrl + shift + f 在工程中全局查找某字符
" 需先安装ack: sudo apt-get install ack
Bundle 'dyng/ctrlsf.vim'

" 打开最近历史文件
Bundle 'yegappan/mru'

" dir diff
Bundle 'will133/vim-dirdiff'

" html/css插件
Bundle 'mattn/emmet-vim'

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
"set background=dark                                             " 设置vim背景为深色
set cursorline                                                  " 突出显示当前行
set cursorcolumn                                                " 突出显示当前列
set noerrorbells
set novisualbell
set t_vb=
set modifiable

let mapleader=','

colorscheme molokai                                             " 设置molokai高亮主题
let g:rehash256 = 1                                             " 试图将256色版本尽可能接近默认的(dark)GUI版本 
hi Normal  ctermfg=252 ctermbg=none                             " 背景透明

" 格式化状态行显示的内容
set statusline=[%t]\ %y\ %m%=%{&fileencoding}\ [%{&ff}]\ [%l,\ %c]\ [%L]\ [%p%%]

" 打开一个文件自动定位到上一次退出的位置 <标配>
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" *********** NERDTree插件配置 ***********
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=35                                          " 设置窗口宽度为25

" <F3>关闭打开目录树
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
" 打开树状文件目录
map <C-F3> \be
" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTress File highlighting 不同的扩展名现实不同的颜色
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" ********** indentLine插件 **********
let g:indentLine_char = '┊'                                     "代码块对齐用┊符号


" 为了方便复制内容到窗口外，快捷键取消窗口模式
map <F4> :call ToggleCcinnMouse()<CR>
imap <F4> <ESC> :call ToggleCcinnMouse()<CR>
func! ToggleCcinnMouse()
 if &mouse == "a"
    exec "set mouse="
    exec "set nornu"
    exec "set nonu"
    exec "set nolist"
 else 
     exec "set mouse=a"
     exec "set rnu"
     exec "set nu"
     exec "set list"
 endif
endfunc

" 取消掉vim scratch
set completeopt=menu

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
let g:syntastic_auto_jump = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" *********** nerdcommenter快速注释插件配置 **********
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_php = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" *********** nru 配置参数 ***************************
"let g:MRU_File = '~/.mru_history_record_file'       " 记录历史记录文件
let g:MRU_Max_Entries = 50                          " 记录调试
let g:MRU_Include_Files = '\.php$\|\.class$'         " 只记录php结尾和class结尾的文件
let g:MRU_Window_Height = 15                        " MRU窗口大小15
let g:MRU_Use_Current_Window = 0                    " 用当前window打开
let g:MRU_Auto_Close = 1                            " 自动关闭
let g:MRU_Max_Menu_Entries = 20                     " 菜单栏只现实最近的20条记录


" PHP函数提示
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
    set complete-=k complete+=k
endfunction

" map <F5> :!php %
" 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

"格式化PHP文件
map <leader>pcf :call FormatPhp(1)<CR>
func! FormatPhp(args)
    if &filetype =='php'
        if a:args > 0 
            exec "w"
        endif
        call system('php-cs-fixer fix '.expand('%:p').' --config=~/.php_cs')
        exec "e!"
    endif
endfunc

" 为了方便复制内容到窗口外，快捷键取消窗口模式
map <F4> :call ToggleCcinnMouse()<CR>                                                                                 
imap <F4> <ESC> :call ToggleCcinnMouse()<CR>                                                                          
func! ToggleCcinnMouse()                                                                                              
   if &mouse == "a"                                                                                                    
     exec "set mouse="                                                                                                 
     exec "set nornu"                                                                                                  
     exec "set nonu"                                                                                                   
     exec "set nolist"                                                                                                 
   else                                                                                                                                                                                                                                          
     exec "set mouse=a"                                                                                                
     exec "set rnu"                                                                                                    
     exec "set nu"                                                                                                     
     exec "set list"                                                                                                   
   endif                                                                                                               
endfunc 


"********** 新建.c,.h,.sh,.php文件，自动插入文件头 **********
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.php exec ":call SetHead()"
"" 定义函数SetHead，自动插入文件头
func! SetHead()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'php'
        call setline(1,"<?php")
        call append(line("."),' ')
        call append(line(".")+1,'/**')
        call append(line(".")+2,' *')
        call append(line(".")+3,' * '.expand('%'))
        call append(line(".")+4,' *')
        call append(line(".")+5,' * @author    '.'Caiwh <471113744@qq.com>')
        call append(line(".")+6,' * @version   '.strftime('20%y年%m月%d日'))
        call append(line(".")+7,' * @copyright '."Copyright caiwh's code")
        call append(line(".")+8,' *')
        call append(line(".")+9,'*/')
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
endfunc

" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
