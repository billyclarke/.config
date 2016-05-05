set nocompatible
set showcmd " shows what you are typing as a command
set cindent
set expandtab " spaces instead of tabs
set smarttab
syntax on

set tabstop=2 " tabs are 2 spaces
set shiftwidth=2 " indents are 2 spaces
set number " line numbers
set ls=2
set ruler
set history=200
set backspace=indent,eol,start
set bg=light

set wildmenu  " Tab completion
set wildmode=list:longest,full
set hlsearch

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"highlight trailing whitespace as error
match ErrorMsg '\s\+$'

set mouse=a "use mouse click to switch between windows

set pastetoggle=<F2>

"shift hjkl behavior over one to jkl; and use graphc line instead
nnoremap j h
nnoremap k gj
nnoremap l gk
nnoremap ; l

"Use gk and gl to acheive usual new-line navigation behavior
nnoremap gk j
nnoremap gl k


"highlight trailing whitespace as error
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"highlight lines that are too long
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec ('match RightMargin /\%>' . &textwidth . 'v.\+/')
  endif
endfunction

augroup highlight_toolong2
  au!
  au FileType,BufEnter * call HighlightTooLongLines()
augroup END

"Draw line at column after textwidth
set colorcolumn=+1
highlight ColorColumn ctermbg=gray guibg=gray9
