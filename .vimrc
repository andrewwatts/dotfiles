
" This must be first, because it changes other options as side effect
set nocompatible


" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" change the mapleader from \ to ,
let mapleader=","


" enable syntax highlighting
if &t_Co >= 256 || has("gui_running")
   colorscheme molokai
else
   colorscheme desert
endif
if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif


" setup correct spacing and tab widths
set expandtab                   " expand tabs to spaces
set softtabstop=4               " 4 spaces
set shiftwidth=4                " 4 sapces when autoindenting
set tabstop=4                   " 4 spaces
"set autoindent                 " automatic indent new lines
"set smartindent                
"set copyindent                  " copy the previous indentation on autoindent
set paste                       " enable paste mode for copy and paste


" enable filetype detection
filetype plugin on

" tab completion
set wildmode=list:longest,list:full

" ignore these file types
set wildignore=*.o,*~,*.pyc,*.pyo,*.git


" ignore case, unless uppercase when searching
set ignorecase
set smartcase
" show the best match so far as search is typed
set incsearch
" highlight search terms
set hlsearch 


" change teh to the
abbreviate teh the


" more nifty ux settings
set ruler               " always show cursor
set number              " line numbers
set backspace=2         " allow backspace in insert mode
set nostartofline       " don't jump to start of line when scrolling
set showmatch           " show matching brackes and braces
set visualbell          " no noise
set hidden              " allow unwritten changes, by hiding bufferss
set nowrap              " don't wrap lines
set title               " change the terminal title
set mouse=a             " enable mouse use if terminal allows it
"handle long lines
"set textwidth=79
"set formatoptions=qrn1
set list listchars=tab:\ \ ,trail:·     " mark trailing whitespace with a ·
set backspace=indent,eol,start          " allow backspacing over everything in insert mode


if version > 730
    set colorcolumn=76,120
endif

" avoid backup and swp files
set nobackup
set noswapfile


" status bar stuff
set laststatus=2        "always have a status line
set cmdheight=2         "use status bar 2 rows hight


" map window splitting
nnoremap <leader>s <C-w>s<C-w>l
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" write a file you forgot to open with sudo privileges
cmap w!! w !sudo tee % >/dev/null


" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif



" setup support for ack 
"function! AckGrep(command)
"    cexpr system("ack " . a:command)
"    cw " show quickfix window already
"endfunction
"command! -nargs=+ -complete=file Ack call AckGrep(<q-args>)
map <leader>a :Ack<space>
"map <leader>at :Ack<space>--django<space>--ignore-dir=lib<space>--ignore-dir=wordpress_blog<space>
"set grepprg=ack
"set grepformat=%f:%l:%m


" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
 

" Command-T configuration
let g:CommandTMaxHeight=20


"Bclose configuration
map <Leader>bc :Bclose<cr>


"BufExplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerShowTabBuffer=0
let g:bufExplorerSortBy='fullpath'
let g:bufExplorerSplitOutPathName=0


"Fugitive (ie: git support)
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


"Pylint support
let g:pylint_onwrite=0                "disable checking on every save


" TagList Configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'      " location of ctags
let Tlist_Close_On_Select=0                     " close tlist when tag selected
let Tlist_Exit_OnlyWindow=1                     " close vim when only tlist is present
let Tlist_Use_Right_Window=1                    " open on the right side
let Tlist_Auto_Update=1                         " update to include edits
let Tlist_Process_File_Always=1                 " process files when taglist window is closed
map <leader>tlt :TlistToggle<cr>
map <leader>tlc :TlistClose<cr>


" autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python compiler pylint
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
