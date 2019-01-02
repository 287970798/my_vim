:set nu
:syntax enable
:source $VIMRUNTIME/syntax/php.vim

" 设置缩进
" 说明
" TAB符号与键盘TAB键不同
" tabstop 是TAB符号	tabstop=4 一个TAB符号4个空格 注意=两侧不能有空格，直接写数字，否则报错
" softtabstop 是TAB键	softtabstop=4 按一次TAB键，缩进4个空格
" shiftwidth 换行时自动缩进数 和 行选择后 < 和 > 手动缩进数，如果expandtab开启，单位是space，否则是TAB符号
" expandtab 将TAB符号替换成space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent

"单独设置php文件的缩进
"用到了autocmd
autocmd FileType php setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab cindent

"括号、引号补全
"
"按键映射
"map 递归映射
"noremap 非递归映射
"unmap 删除映射
"mapclear 清除映射
"
"映射后缀
"n 普通模式生效
"v 可视模式生效
"i 插入模式生效
"c 命令行模式生效
"
"inoremap { {<CR>}<ESC>O    在插入模式下，输入{，映射为 { + 回车 + } + ESC + O(大写o，上插一行)
"
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

inoremap <c-e> <ESC>A

"高亮当前行和列
"set cuc
"set cul

"set cursorcolumn
set cursorline
"highlight 高亮配置
"CursorLine  和 CursorColumn 分别表示当前所在的行列
"cterm 表示为原生vim设置样式，设置为NONE表示可以自定义设置。
"ctermbg 设置终端vim的背景色
"ctermfg 设置终端vim的前景色
"guibg 和 guifg 分别是设置gvim的背景色和前景色，本人平时都是使用终端打开vim，所以只是设置终端下的样式

highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

