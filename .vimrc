" just for the weird unix keyboard
map [25~ <esc>


set cindent
set number
syntax on
set tabstop=2
set expandtab
set smarttab
set softtabstop=0
set shitwidth=2
set autoindent
color evening
set foldmethod=syntax
" save and restore folding on file close / reopen
set viewdir=$HOME/.vim_view//
au BufWinLeave,BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent loadview
