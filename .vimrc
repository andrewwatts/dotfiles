" enable syntax highlighting
syntax on


" setup correct spacing and tab widths
set expandtab                   " expand tabs to spaces
set softtabstop=4               " 4 spaces
set shiftwidth=4                " 4 sapces
set tabstop=4                   " 4 spaces
"set autoindent                 " automatic indent new lines
"set smartindent                


" enable filetype detection
filetype on


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


" autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
