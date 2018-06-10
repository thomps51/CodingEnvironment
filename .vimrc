" just for the weird unix keyboard
"map [25~ <esc>
color koehler
set tabpagemax=100
set tabstop=4
set expandtab
set smarttab
set softtabstop=0
set shiftwidth=4

" jk is escape
inoremap jk <esc>

" .py file options
autocmd FileType py call SetPythonOptions()
function SetPythonOptions()
    set tabstop=4
    set expandtab
    set smarttab
    set softtabstop=0
    set shiftwidth=4
endfunction

" C++ file options
autocmd FileType cpp,c,cxx,h,hpp call SetCppOptions()
function SetCppOptions()
    set cindent
    set cinoptions=g0,t0,(3,c3,C3
    set foldmethod=syntax
    set foldlevelstart=10 " open most folds by default
    " space open/closes folds
    nnoremap <space> za
    map <C-I> :pyf /path/to/clang-format.py<cr>
endfunction

set showmatch
set cursorline
set number
syntax on
set autoindent
" save and restore folding on file close / open
set viewdir=$HOME/.vim_view//
au BufWinLeave,BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent loadview

" stop from putting DOS endline characters
set fileformat=unix
set fileformats=unix,dos
set backspace=indent,eol,start

set lines=68
set columns=104

set incsearch
set nohlsearch

set viminfo='10

set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,full

set mouse=a

map ,c :! ~/scripts/columnize.sh<ENTER>

" Diff the current buffer with the data currently saved in the file
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Add header to .cpp file upon creation
autocmd bufnewfile *.cpp so ~/cpp_header.txt
autocmd bufnewfile *.cpp exe "1," . 8 . "g/Created:.*/s//Created: " .strftime("%d %B %Y")

autocmd bufnewfile *.h so ~/cpp_header.txt
autocmd bufnewfile *.h exe "1," . 8 . "g/Created:.*/s//Created: " .strftime("%d %B %Y")
