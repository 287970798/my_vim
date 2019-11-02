:echo '>^.^<'

"Basic settings ------------------------{{{

:set nu
:syntax enable

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

"}}}

"FileType-specific settings ---------------------------{{{
:source $VIMRUNTIME/syntax/php.vim
"自动命令 ----------------------{{{
augroup myautocmd
    autocmd!
    autocmd FileType php setlocal foldmethod=indent
    autocmd FileType php setl shiftwidth=4 tabstop=4 softtabstop=4 expandtab cindent "单独设置php文件的缩进
    autocmd FileType vim setlocal foldmethod=marker
augroup end
"}}}

"}}}

"Mappings -----------------------{{{
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
let mapleader = "\<Space>"
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ` ``<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

inoremap <c-e> <ESC>A
inoremap <c-b> <ESC>I
inoremap <c-l> <ESC>la

"当前单词大小写
inoremap <c-u> <ESC>gUiwgi
inoremap <c-d> <ESC>guiwgi
nnoremap <leader>u gUiw`]
nnoremap <leader>d guiw`]

"编辑及应用vimrc
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"注释
nnoremap <leader>c I//<esc>
inoremap <c-c> <esc>I//<esc>gi
"}}}

"Abbreviations --------------------------------{{{
iabbrev ncls class Name <cr>{public function __construct<c-v>()<cr>{//todo...<esc>4k0fNve
iabbrev pubf public function Name <c-v>()<cr>{//todo...<esc>2k0fNviw
iabbrev pubsf public static function Name <c-v>()<cr>{//todo...<esc>2k0fNviw
iabbrev prof protected function Name <c-v>()<cr>{//todo...<esc>2k0fNviw
iabbrev prosf protected static function Name <c-v>()<cr>{//todo...<esc>2k0fNviw
iabbrev prif private function Name <c-v>()<cr>{//todo...<esc>2k0fNviw
iabbrev prisf private static function Name <c-v>()<cr>{//todo...<esc>2k0fNviw
iabbrev __cnst __construct<c-v>()<cr>{
iabbrev /*** /**<cr>Something<space><cr>@param<space><cr>@return<space><cr>/<esc>3kfSve
"}}}

"StatusLine ----------------------------------{{{


"}}}

"高亮当前行和列 ----------------------{{{
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
"}}}

"Vundle设置 ------------------------------{{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'indent/html.vim'

call vundle#end()
filetype plugin indent on

"永远显示状态栏
set laststatus=2  
"支持 powerline 字体
let g:airline_powerline_fonts = 1  
"显示窗口tab和buffer
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme='bubblegum'
"}}}

"Test ----------------------------------{{{

augroup test
    autocmd!
    autocmd BufRead,BufNewFile *.php onoremap ih :execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
augroup end


"}}}
