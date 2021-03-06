set nocompatible
set background=dark
filetype on
filetype plugin on
filetype indent on
set autowrite

" allow switching between buffers without saving
set hidden
let mapleader = ","
set showcmd
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle Bundle manager. Great stuff.
" https://github.com/gmarik/vundle
"
" If there is a slash in the bundle-name
" it automatically installs from GitHub.
Bundle 'gmarik/vundle'

" very nice file browser
Bundle 'scrooloose/nerdtree'

" auto complete
Bundle 'Valloric/YouCompleteMe'

" some markdown support
Bundle 'https://github.com/plasticboy/vim-markdown.git'

" full path fuzzy search
Bundle 'kien/ctrlp.vim'

" some yaml support
Bundle 'https://github.com/avakhov/vim-yaml.git'

" git tools
Bundle 'tpope/vim-fugitive'

Plugin 'Xuyuanp/nerdtree-git-plugin'

" zen coding (for HTML)
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" colors
Bundle 'flazz/vim-colorschemes'

" jump around documents
Bundle 'Lokaltog/vim-easymotion'

" prereq for FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'


" Edit encrypted files
Bundle 'openssl.vim'

" path searching
Bundle 'git://git.wincent.com/command-t.git'

" formatting for js
Bundle "pangloss/vim-javascript"

" some autocompletion
" Bundle 'Valloric/YouCompleteMe'

" more js syntax options
Bundle 'maksimr/vim-jsbeautify'

 Bundle 'einars/js-beautify'

" pretty sweet linting/error checking. Works on save
Bundle 'https://github.com/scrooloose/syntastic.git'

" creates a nice way to traverse buffers in a 'tab like' way.
" Bundle 'fholgado/minibufexpl.vim'

" key combos for 'pairs' of things. Mostly previous/next type stuff
Bundle 'tpope/vim-unimpaired'
Bundle 'wojtekmach/vim-rename'
" so ~/sources/tern/vim/tern.vim
syntax on

Plugin 'while1eq1/vim-monokai-black'

" MBA tiny escape button fix
imap <C-c> <esc>

try
    syntax enable
	colorscheme monokai
catch
endtry

filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set noexpandtab
set smartindent
set ruler
set relativenumber
set ttyfast
set autoread
set more
set cursorline!

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1

let NERDTreeShowHidden=1

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
"set list
"set listchars=nbsp:¬,trail:·

hi User1 ctermfg=196 guifg=#eea040 guibg=#222222
hi User2 ctermfg=75 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 ctermfg=239 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

" Statusline
" https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink#L160
set statusline=                                     " Override default
set statusline+=%1*%{fugitive#statusline()[4:-2]}%* " Show fugitive git info
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total lines>:<column>
set statusline+=%5*\ %*                             " Set ending space

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" No annoying sound on errors
set noerrorbells
set novisualbell
set timeoutlen=500

" visual bell color

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2


set laststatus=2

" Starting from vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" Automatically re-indent on paste
" http://www.reddit.com/r/vim/comments/pkwkm/awesome_little_tweak_automatically_reindent_on/
"nnoremap <leader>p p
"nnoremap <leader>P P
"nnoremap p p'[v']=
"nnoremap P P'[v']=

" Leave insert-mode after 15 seconds of no input.
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2ol6wd
"
" Muss in die einzelnen Filetypes, da ich so keine Emails schreiben kann. :)
" au CursorHoldI * stopinsert
" au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
" au InsertLeave * let &updatetime=updaterestore

" Breaking lines with \[enter] without having to go to insert mode (myself).
nmap <leader><cr> i<cr><Esc>

" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" Save and run current file
map <silent> <F5> <esc>:w<CR><esc>:!./%<CR>

" Toggle copy and pastemode, echoing current status
map <silent> <C-F7> :only<CR>:set invnumber invlist number?<CR>
map <silent> <F7> :set invpaste paste?<CR>i

" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.vimrc source ~/.vimrc

" Stuff taken from
" https://github.com/r00k/dotfiles/blob/master/vimrc
command! Q q
command! W w

" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
let loaded_matchparen = 1

let g:ctrlp_map = '<c-p>'
nmap <silent> <C-D> :NERDTreeToggle<CR>
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules*

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
