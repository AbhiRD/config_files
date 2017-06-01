
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

" to install plugins------------------------------------
call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

NeoBundle 'VundleVim/Vundle.vim'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/Conque-GDB'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'lifepillar/vim-solarized8'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'bling/vim-airline'
NeoBundle 'powerline/fonts'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Valloric/YouCompleteMe'

call neobundle#end()  
filetype plugin indent on

NeoBundleCheck  
" NeoBundle Scripts-----------------------------

" prevent vim from giving a warning it the swp file is open
set shortmess=A
"---------------------------------------------------------------------

 "This enables the airline extension
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_theme='solarized'

" This sets the color scheme-----------------------------------------
"enable syntax highlighting
syntax enable
colorscheme solarized8_dark
"--------------------------------------------------------------------
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
let g:ycm_autoclose_preview_window_after_insertion = 1
"'/home/ram/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_config.py'
" This is for mapping ctrl-c, ctrl-v, ctrl-a------------------------
:vmap <C-c> "*y
:nmap <C-v> "*p
:nmap <C-a> ggVG
:vnoremap <C-X> "+x
set backspace=indent,eol,start
"-------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]

" this is for ctrl-s saving both in insert and normal mode----------
:nmap <c-s> :w<CR>
:inoremap <c-s> <c-o>:update<CR>
"-------------------------------------------------------------------
" :imap <c-z> <Esc>:u<CR>\|i
" scrolling up and down multiple lines atonce-----------------------
:nmap <c-up> -3
:nmap <c-down> +3
:vmap <c-up> -3
:vmap <c-down> +3
"-------------------------------------------------------------------

" other editor settings---------------------------------------------
set tabstop=4
set number
set mouse=a

"file manager------------------------------------------------------
" Increased NERDTree window size
let g:NERDTreeWinSize=80 
" navigates to the next buffer
:vmap <c-t> :bnext<CR>
:nmap <c-t> :bnext<CR>
:imap <c-w> <Esc>:w\|bd<cr>
:vmap <c-w> :w\|bd<cr>
:nmap <c-w> :w\|bd<cr>
" Tab navigation like Firefox.

" maps ctrl-o to open the files------------------------------------
:map <c-o> :NERDTree<CR> 
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
" save and close only current file not vim entirely
":ab wq :w\|bd
:set guitablabel=%t
"-----------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>
"-----------------------------------------------------------------
" toggling between insert, normal and visual mode upon triple key press
:imap vv <Esc>v
:nmap vv <Esc>v
:vmap ii <Esc>i
:nmap ii <Esc>i

"for compiling, running and debugging press ctrl cc, ctrl ccr, ctrl ccd. It
"autosaves.
:imap <c-c><c-c> <Esc>:update <CR>\|<Esc>:!make<CR>
:nmap <c-c><c-c> :update<CR>\|<Esc>:!make<CR>
":imap <c-c><c-c><c-r> <Esc>:update<CR>\|<Esc>:!make && make run<CR>
":nmap <c-c><c-c><c-r> :update<CR>\|<Esc>:!make && make run<CR>
":imap <c-c><c-c><c-d> :update<CR>\|<Esc>:!make && make debug<CR>
":nmap <c-c><c-c><c-d> :update<CR>\|<Esc>:!make && make debug<CR>

" lets add other simple features to this vimrc file
:imap qq <Esc>:
:vmap qq <Esc>:
:nmap qq <Esc>:
:vmap <Tab> >gv
:vmap <S-Tab> <gv
"-----------------------------------------------------------------
" once the header trigger is entered, ultisnips expands when enter is pressed
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
"-----------------------------------------------------------------
" short cut to open tasklist
:ab tasklist :e ~/Dropbox/tasklist/tasklist.txt
:ab f /
:map <C-r> :%s!<!\&lt;!<cr>:%s!>!\&gt;!<cr>
"----------------------------------------------------------------
" some vim-latex stuff that they said is necessary to be put in bashrc--------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"-------------------------------------------------------------------
" scroll line by display rather than line by linebreaks
:nnoremap j gj
:nnoremap k gk
:vnoremap j gj
:vnoremap k gk
:nnoremap <Down> gj
:nnoremap <Up> gk
:vnoremap <Down> gj
:vnoremap <Up> gk
:inoremap <Down> <C-o>gj
:inoremap <Up> <C-o>gk
"------------------------------------------------------------------
" in normal mode we cant navigate after the end of the line. This enables us
" to move a character after the end of the line.
set virtualedit=onemore 


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endifi
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
