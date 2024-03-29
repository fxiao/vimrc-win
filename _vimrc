set nocompatible                  " 关闭Vi兼容模式
set encoding=utf-8                " 设置编码为utf-8
set fileencodings=utf-8,gbk
set fileencoding=utf-8
set helplang=cn                   " 帮助文件为中文
set fileformat=unix
language messages zh_CN.utf-8
set mouse=a                       " 启用鼠标
colorscheme desert

set nu                            " 显示行号
set ignorecase                    " 忽略大小写 

set hlsearch                      " 高亮显示搜索结果 
set incsearch                     " 键入时同步搜索
set cindent
set cursorline
set smartindent
" tab处理
set textwidth=0
set sw=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent                    " 新行时自动缩进 
set backspace=indent,eol,start    " 退格键何时可以删除光标之前的字符
set expandtab
"set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
set clipboard+=unnamed
set completeopt=longest,menu
"
"" 高亮
set showcmd                       " 显示完整的命令已经完成的部分 
"set paste
set ruler                         " 显示当前光标位置 
syntax enable                     " 语法高亮 
syntax on

" 映射
nmap tl :Tlist<cr>
"let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=1
"let Tlist_File_Fold_Auto_Close=1

let mapleader=","

"自动补全
filetype plugin indent on         " 自动识别文件类型，用文件类型plugin脚本，使用缩进定义文件 
"NERD Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeCaseSensitiveSort=0
let NERDTreeHighlightCursorline=1

nmap nt :NERDTreeToggle<cr>

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_auto_complete = 1
"let g:neocomplcache_disable_auto_complete = 1

" 判断文件类型
if expand("%:e") == "py"
	" 程序片断
	iab <expr> dtsss strftime("%F")
	iab <expr> foutsss expand("%")
	imap <F11> #!/usr/bin/env python<cr># coding=utf-8<cr>#--------------------------------------------------------------------------<cr># 文件名:       foutsss <cr># 说明：        目的、作用说明<cr>#<cr># 版本：        0.01<cr># 作者：        xiao<cr>#<cr># 创建时间：    dtsss <cr># 许可证：      Apache License V2.0<cr>#--------------------------------------------------------------------------<cr><cr>
    imap <F9> <esc>0/def <cr>wywo<cr><backspace>#------------------------------------------ End def <esc>p:nohls<cr>a()<esc>2ko"""<cr>"""<esc>O

	"imap <F9> <esc>o<backspace>#------------------------------------------ End def <esc>0?def <cr>wyw/#------------------------------------------ End def<cr>$p:nohls<cr>a()<cr><cr><esc>3kO## 方法注释<cr>#<cr>#  @param<cr>#  @return<cr>#<esc>jzzo
    imap <F10> <esc>0/class <cr>wywo<cr><backspace>#-------------------------------------------------- End class <esc>p:nohls<cr><esc>2ko"""<cr>"""<esc>O

	"imap <F10> <esc>o<backspace>#------------------------------------------------------ End class <esc>0?class <cr>wyw/#------------------------------------------------------ End class<cr>$p:nohls<cr>a()<cr><cr><esc>3kO## 类注释<cr>#<esc>jo<cr>

	nmap <F5> :w<cr>:!python %
endif

" 快捷键
imap { {}<esc>i
imap } <c-r>=ClosePair('}')<CR>
imap ( ()<ESC>i
imap ) <c-r>=ClosePair(')')<CR>
imap [ []<ESC>i
imap ] <c-r>=ClosePair(']')<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

au BufNewFile,BufRead *.ini,*/.hgrc,*/.hg/hgrc setf ini
" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt

" ######### VimWiki 写作助手 ######### "
" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1

" html 标签
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,!--'

" 多个维基项目的配置
let g:vimwiki_list = [{
\ 'path': 'D:/vimwiki/wiki',
\ 'path_html': 'D:/vimwiki/html',
\ 'template_path': 'D:/vimwiki/template/',
\ 'template_default': 'def_template',
\ 'template_ext': '.html',
\ 'auto_export': 0,
\ 'diary_link_count': 10,
\ 'nested_syntaxes': {'C': 'c', 'C++': 'cpp', 'Haskell': 'haskell', 'Ruby': 'ruby', 'SQL': 'sql', 'HTML': 'html', 'CSS': 'css', 'JavaScript': 'javascript', 'Vim': 'vim', 'Make': 'make'}
\ }]

nmap <F8> :Calendar<cr>
map <F4> :Vimwiki2HTML<CR>
map <S-F4> :VimwikiAll2HTML<cr>
