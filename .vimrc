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

"python代码补全
"Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
"Bundle 'Valloric/YouCompleteMe'
" PHP代码补全
Bundle 'shawncplus/phpcomplete.vim'
"
" 符号自动补全
Bundle 'Raimondi/delimitMate'

" 文件搜索
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/mru.vim'

" 静态语法检查
"Bundle 'scrooloose/syntastic'
Bundle 'vim-syntastic/syntastic'

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
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
    "        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

map <F9> :call FormatPhp(1)<CR>
func! FormatPhp(args)
    if &filetype =='php'
        if a:args > 0 
            exec "w"
        endif
        call system('php-cs-fixer fix '.expand('%:p').' --config=/wwwroot/share/localhost2/test/.php_cs')
        exec "e!"
    endif
endfunc
" 退出的时候，是否格式化文件
"":autocmd VimLeavePre *.php call FormatPhp(0)

map <F10> :call Test()<CR>
func! Test()
    let str = expand("<cword>")
    echo str
endfunc
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
let NERDTreeWinSize=35                                          " 设置窗口宽度为25
"let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭


" *********** ctags插件配置 ***********
set tags+=~/.vim/ctags-5.8
" 强烈建议添加此项，自定义索引文件
if getfsize(".vimscript")>0

   source .vimscript

endif 
"set tags=/wwwroot/share/sns_test_new/modules/apps/xmen/tags
"set autochdir


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
let g:syntastic_auto_jump = 1
"let g:syntastic_cpp_include_dirs = ['/usr/include/qt']
"let g:syntastic_cpp_compiler_options = '-std=gnu++11 -Wall'
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" ************************** Shougo/unite 插件配置 ***************************/
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]

" ******************* phpcompele *************************
"let g:phpcomplete_mappings = {
""   \ 'jump_to_def': '<C-]>',
""   \ 'jump_to_def_split': '<C-W><C-]>',
""   \ 'jump_to_def_vsplit': '<C-W><C-\>',
""   \}

" 取消掉vim scratch
set completeopt=menu

"let g:phpcomplete_active_function_extensions = ['mongo']
"let g:phpcomplete_active_class_extensions = ['mongo']
"let g:phpcomplete_active_interface_extensions = ['mongo']
"let g:phpcomplete_active_constant_extensions = [mongo]

" ***************** YouCompleteMe ***********************
"let g:ycm_semantic_triggers =  {
"  \   'c' : ['->', '.'],
"  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"  \             're!\[.*\]\s'],
"  \   'ocaml' : ['.', '#'],
"  \   'cpp,objcpp' : ['->', '.', '::'],
"  \   'perl' : ['->'],
"  \   'php' : ['->', '::'],
"  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"  \   'ruby' : ['.', '::'],
"  \   'lua' : ['.', ':'],
"  \   'erlang' : [':'],
"  \ }




" Set <space> as primary trigger
"inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>


" ********** indentLine插件 **********
let g:indentLine_char = '┊'                                     "代码块对齐用┊符号


" *********** UltiSnips插件配置 **********
let g:UltiSnipsExpandTrigger="<tab>"
""let g:UltiSnipsJumpForwardTrigger="<tab>"
""let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit = "vertical"
"let g:UltiSnipsSnippetDirectories = ["UltiSnips", "bundle/snippets"]
let g:UltiSnipsSnippetDirectories = ["bundle/snippets"]


" ********** rainbow_parentheses插件配置 ***********
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ********** vim-multiple-cursors插件配置 ***********
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" ********** airline插件配置 ***********
let g:airline_powerline_fonts=1     "配置airline使用powerline字体
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" *********** vimwiki插件配置 ***********
"let g:vimwiki_list = [{'path' : '~/.vimwiki/',
"        \'template_path' : '~/.vimwiki/template/',
"        \'template_default' : 'default_template',
"        \'template_ext' : '.html',
"        \'path_html': '~/.vimwiki/html/'}
"        \]


" ********** mru插件配置 **********
let MRU_Auto_Close = 1
let MRU_Max_Entries = 40

" *********** 重新映射一些键 **********
" 设置以空格打开和关闭折叠
nmap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

" 当一行很长时把分开的段行当作一行来移动
map j gj
map k gk

" 将Esc键映射到jj,zz
" im jj <Esc>
" im JJ <Esc>
" im zz <Esc>
" im ZZ <Esc>
" map zz <Esc>
" map ZZ <Esc>

" quickfix相关的一些快捷键
map cop :copen<CR>
map ccl :cclose<CR>
map cn :cn<CR>
map cp :cp<CR>

" emacs式的行内跳转
map <c-a> ^
map <c-e> $
imap <c-a> <Esc>^i
imap <c-e> <Esc>$a

" visual模式下快速对齐
vnoremap < <gv
vnoremap > >gv

" <F3>关闭打开目录树
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
" 打开树状文件目录
map <C-F3> \be

" 设置文件类型辅助
map <leader>s :setfiletype
" 更方便的窗口间跳转
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l
map <leader>h <c-w>h
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" 为了方便复制内容到窗口外，快捷键取消窗口模式
map <F4> :call ToggleCcinnMouse()<CR>
imap <F4> <ESC> :call ToggleCcinnMouse()<CR>
func! ToggleCcinnMouse()
 if &mouse == "a"
    exec "set mouse="
 else 
     exec "set mouse=a"
 endif
endfunc

" <F7>生成ctags
map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
im <F7> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap go g<C-]>
nmap bk <C-t>

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" C,C++的调试
map <F6> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

" <F4>语法检查
"map <F4> :SyntasticCheck php (php)<CR>
"im <F4> <Esc>:SyntasticCheck php (php)<CR>

"map <F4> call CheckSyntax<CR>
"im <F4> call <Esc>CheckSyntax<CR>
"function! CheckSyntax()
" if &filetype!="php"
"" echohl WarningMsg | echo "Fail to check syntax! Please select the right file!" | echohl None
"" return
"" endif
" if &filetype=="php"
" " Check php syntax
"" setlocal makeprg=\"php\"\ -l\ -n\ -d\ html_errors=off
 " Set shellpipe
"" setlocal shellpipe=>
 " Use error format for parsing PHP error output
"" setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"" endif
" execute "silent make %"
"" set makeprg=make
" execute "normal :"
" execute "copen"
"endfunction


"" 代码格式优化化
"map <F4> :call FormartSrc()<CR><CR>
"" 定义FormartSrc()
"func FormartSrc()
"    exec "w"
"    if &filetype == 'c'
"        exec "!astyle --style=ansi -a --suffix=none %"
"    elseif &filetype == 'cpp' || &filetype == 'hpp'
"        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
"    elseif &filetype == 'perl'
"        exec "!astyle --style=gnu --suffix=none %"
"    elseif &filetype == 'py'||&filetype == 'python'
"        exec "r !autopep8 -i --aggressive %"
"    elseif &filetype == 'java'
"        exec "!astyle --style=java --suffix=none %"
"    elseif &filetype == 'jsp'
"        exec "!astyle --style=gnu --suffix=none %"
"    elseif &filetype == 'xml'
"        exec "!astyle --style=gnu --suffix=none %"
"    else
"        exec "normal gg=G"
"        return
"    endif
"    exec "e! %"
"endfunc

" <F8>更新cscope文件
map <F8> :!cscope -Rbq<CR>
im <F8> <Esc>:!cscope -Rbq<CR>

" 修改<leader>的键盘映射
nmap ' <leader>
" 当按下\+Enter时取消搜索高亮
map <silent> <leader><CR> :noh<CR>

" Unite插件配置
map <Leader>b :Unite -winheight=10 buffer<CR>
map <Leader>r :MRU<CR>
map <leader>f :NERDTreeToggle<CR>

" Tagbar插件配置
let g:tagbar_autoclose=1
"map <leader>t :TagbarToggle<CR>
map <F2> :TagbarToggle<CR>
"

"********** 新建.c,.h,.sh,.php文件，自动插入文件头 **********
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.php,*.py exec ":call SetHead()"
"" 定义函数SetHead，自动插入文件头
func! SetHead()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding=utf-8 -*-")
        call append(line(".")+1, "")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    elseif &filetype == 'php'
        call setline(1,"<?php")
        call append(line("."),' ')
        call append(line(".")+1,'/**')
        call append(line(".")+2,' *')
        call append(line(".")+3,' * -------------------------------')
        call append(line(".")+4,' * '.expand('%'))
        call append(line(".")+5,' * -------------------------------')
        call append(line(".")+6,' *')
        call append(line(".")+7,' * @author Caiwh')
        call append(line(".")+8,' * @version '.strftime('20%y-%m-%d'))
        call append(line(".")+9,' * -------------------------------')
        call append(line(".")+10,' */')
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: Caiwh")
        call append(line(".")+2, "  > Mail: xxxx@mailtype.com")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
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

    if &filetype == 'php'
        call append(line(".")+11,"class ".expand("%:r")." {")
        call append(line(".")+12,"")
        call append(line(".")+13,"}")
    endif
    " 新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G


" ********* 实用设置 *********
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
