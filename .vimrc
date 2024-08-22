set nocompatible " remote
filetype off
" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()
Plug 'jiangmiao/auto-pairs '
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes', { 'frozen': 1 }
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'  " VCS(Version Control System)信息,允许在vim上执行git指令
"Plug 'mhinz/vim-signify'  " 同gitgutter但支持Git/svn/mercurial/cvs 在侧边栏实时显示修改状态 remote
Plug 'airblade/vim-gitgutter', { 'lazy': 1 }   "hunks信息以及在侧边栏显示修改信息
Plug 'ycm-core/YouCompleteMe', { 'for': ['cc', 'cpp', 'cxx','c', 'python', 'js', 'html'], 'do': './install.py --clangd-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'dstein64/vim-startuptime', { 'lazy': 1, 'on': 'StartupTime' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'junegunn/vim-easy-align'
call plug#end()
" }}}
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:gitgutter_enabled = 0
autocmd VimEnter * GitGutterToggle
" 当离开插入模式或文本内容变更时自动保存
autocmd InsertLeave,TextChanged * if &modified | silent write | endif
" VCS永远显示侧边栏
"set signcolumn=yes
" 使其背景色与行背景一致从而变透明 " kj
highlight! link SignColumn LineNr
" 默认更新时间为4000ms,不利于异步更新
set updatetime=100
" 高亮显示光标所在行和列
set cursorline
set cursorcolumn
set scrolloff=5 "Minimal number of screen lines to keep above and below the cursor.
" ========== airline主题配置（底部状态栏和顶部tab栏）xxrem==============
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled=1 " 启用顶部tab栏
let g:airline_powerline_fonts=1
"++++++++++++++++++++++++++++性能优化++++++++++++++++++++++++++++++
" enable none extensions for opimization
let g:airline_extensions = ['tabline', 'hunks', 'branch']
" cache :hight calls for optimization 
let g:airline_highlighting_cache = 1
" =================================================================
" 自适应不同语言的智能缩进
filetype indent on
" 自动启用文件类型检测和文件类型插件功能，以及文件类型相关的缩进设置
filetype plugin indent on "vundle required"
" 显示光标当前位置，右下角可看到当前行和列数
set ruler
" 高亮显示搜索结果
set   hlsearch "rem
" 启用增量搜索（实时更新搜索匹配项，搭配显示高亮搜索结果）
set incsearch
set history=1000
set wrap       " 当一行内容超出一行显示范围时自动拆行显示
set splitright " 默认右侧打开新buffer
" 在上面的基础上拆行时从以整个单词为单位而非字母
set linebreak
set ignorecase
set smartcase
set fileencoding=utf-8
set langmenu=zh_CN.UTF-8
set encoding=utf-8
" 解决consle输出乱码
set termencoding=cp936
" 自动重新读取
set autoread
" 自动保存
set autowrite
set autoindent
set smartindent
set smarttab
set laststatus=2
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
"让vim把连续数量的空格视为一个制表符(按tab键和删除时插入或删除一个制表符即四个空格)
set softtabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 查找结果 高亮显示
set hlsearch
" 解决vim 退格键（backspace）不能用
set backspace=indent,eol,start
" 禁止备份
set nobackup
set noswapfile
set noundofile
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch

" MAPPINGS --------------------------------------------------------------- {{{
" 将当前行向上移动
inoremap <A-k> <Esc>kddpk
noremap <A-k> kddpk
" 将当前行向下移动
inoremap <A-j> <Esc>ddp
noremap <A-j> ddp
" 保存并退出当前文件
inoremap <A-w> <Esc>:x<CR> 
noremap <A-w> :x<CR>
" 保存并退出所有文件
inoremap <A-s> <Esc>:xa<CR> 
noremap <A-s> :xa<CR>
" 强制退出当前文件
inoremap <A-q> <Esc>:q!<CR>
noremap <A-q> :q!<CR>
" 强制退出所有文件
inoremap <A-a> <Esc>:qa!<CR>
noremap <A-a> :qa!<CR>
" cursor在不同窗口间移动
inoremap <A-h> <Esc><C-w>h
noremap <A-h> <C-w>h
inoremap <A-l> <Esc><C-w>l
noremap <A-l> <C-w>l
inoremap <A-i> <Esc><C-w>k
noremap <A-i> <C-w>k
inoremap <A-m> <Esc><C-w>j
noremap <A-m> <C-w>j
" 窗口尺寸上下左右
noremap <C-h> :vertical resize-5<CR>
noremap <C-l> :vertical resize+5<CR>
noremap <C-k> :res +5<CR>
noremap <C-j> :res -5<CR>
" 在不同文件之间切换
noremap <space>n :bn<CR>
noremap <space>p :bp<CR>
" 退出到normal模式
inoremap jj <Esc>
noremap <space>t :NERDTreeToggle<CR>
noremap <space>r :NERDTreeRefreshRoot<CR>
nnoremap <leader>\ :noh<Esc> "取消高亮
nnoremap +y "+y  "复制到系统剪切板
nnoremap +p "+p  "从系统剪切板粘贴
nnoremap <C-a> ggVG  "全选
" 补全括号
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
inoremap <TAB> <c-r>=SkipPair()<CR>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" This will enable code folding. Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" 首次进入时用绝对行号，从insert退出到normal后换位相对行号
set number
augroup relative_numbser
	autocmd!
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertLeave * :set relativenumber
augroup END

"开启24bit真彩色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" 开启语法高亮功能，不覆盖自定义颜色设置
if !exists("g:syntax_on")
    syntax enable
endif

"设置tab跳出自动补全的括号
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  

"=========打开文件，光标回到上次编辑的位置"==========
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 当所有文件窗口关闭时关闭NERDTree窗口 
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

" YouCompleteMe Configuration -------------------------------------------------------------- {{{
let g:ycm_min_num_of_chars_for_completion=1 " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_identifier_candidate_chars=2
" 触发语义补全
let g:ycm_key_invoke_completion='<C-z>'
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启YCM标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1 "在注释输入中也能补全
let g:ycm_complete_in_strings=1 "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
" 自动触发语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 仅在以下文件类型中使用ycm补全
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
		        \ "python":1,
		        \ "js":1,
		        \ "cc":1,
		    	\ "cs":1,
		    	\ "java":1,
			\ "sh":1,
			\ }
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
" 修改提示框颜色
highlight Pmenu ctermfg=yellow ctermbg=darkgrey guifg=#ABB2BF guibg=#21252B
highlight PMenuSel ctermfg=blue ctermbg=black guifg=white guibg=#2C313C
" }}}

" -----Start interactive EasyAlign in visual mode (e.g. vipga) -----------
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
