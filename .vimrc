
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
   colorscheme mustang
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


" enable filetype detection
filetype plugin indent on 


" ignore case, unless uppercase when searching
set ignorecase
set smartcase


" show the best match so far as search is typed
set incsearch


" change teh to the
abbreviate teh the


" change the color scheme to something i like
colors desert


" more nifty ux settings
set ruler               " always show cursor
set number              " line numbers
set backspace=2         " allow backspace in insert mode
set nostartofline       " don't jump to start of line when scrolling
set showmatch           " show matching brackes and braces
set visualbell          " no noise
set hidden              " allow unwritten changes, by hiding bufferss
set nowrap              " don't wrap lines
set hlsearch            " highlight search terms
set title               " change the terminal title
set mouse=a             " enable mouse use if terminal allows it


" avoid backup and swp files
set nobackup
set noswapfile

" status bar stuff
set laststatus=2        "always have a status line
set cmdheight=2         "use status bar 2 rows hight


" map window splitting
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" write a file you forgot to open with sudo privileges
cmap w!! w !sudo tee % >/dev/null


" autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
