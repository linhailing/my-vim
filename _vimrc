set nocompatible
filetype on
"colorscheme evening	"配色方案
colorscheme desert
set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
set guifont=Monaco:h10	"设置字体为Monaco，大小10
set tabstop=2		"设置tab的跳数
set expandtab
set backspace=2 	"设置退格键可用
"set nu! 		"设置显示行号
set wrap 		"设置自动换行
"set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
"Toggle Menu and Toolbar 	"隐藏菜单栏和工具栏
"set guioptions-=m
"set guioptions-=T
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set mouse=a 		"设置在任何模式下鼠标都可用
set nobackup 		"设置不生成备份文件
"set go=				"不要图形按钮
set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏

"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找

"===========================
"状态栏的设置
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行

"===========================
"代码设置
"===========================
syntax enable "打开语法高亮
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
"set shiftwidth=4 "换行时，交错使用4个空格
set autoindent "设置自动对齐
set ai! "设置自动缩进
"set cursorcolumn "启用光标列
set cursorline	"启用光标行
set guicursor+=a:blinkon0 "设置光标不闪烁
set fdm=indent "
set number
set go=

"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"set guifont=source_code_pro:h14:b:cDEFAULT
set guifont=Courier_new:h14:b:cDEFAULT


"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"插件管理
set rtp+=$VIM\vimfiles\bundle\Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Yggdroot/indentLine'

call vundle#end()
filetype plugin indent on    " required
" plugin config

"powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
" set encoding=utf-8 " Necessary to show Unicode glyphs

" 关闭NERDTree快捷键 leader \
" <k0> - <k9> 小键盘 0 到 9
" <S-...> Shift＋键
" <C-...> Control＋键
" <M-...> Alt＋键 或 meta＋键
" <A-...> 同 <M-...>
" <Esc> Escape 键
" <Up> 光标上移键
" <Space> 插入空格
map <leader>t :NERDTreeToggle<CR>
map <leader>c :NERDTreeClose<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=21
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" theme
syntax enable
set background=dark
colorscheme solarized


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" config key
let mapleader=","
imap jj <Esc>
nmap <leader>v "+gp
nmap <leader>c "+y

" mattn/emmet-vim
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall
let g:user_emmet_leader_key='<leader>e'


let g:neocomplcache_enable_at_startup = 1


" 设置缩进
" 设置expandtab:
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2 "设置缩进宽度 
set cindent "启用cindent缩进结构 
set autoindent "启用autoindent缩进结构 
set smartindent "启用smartindent缩进结构
