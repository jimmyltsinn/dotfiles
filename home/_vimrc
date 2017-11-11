set nocompatible	" Use Vim defaults (much better!)

" call pathogen#helptags()
execute pathogen#infect()

set tabstop=4
set shiftwidth=4
set backspace=2
set expandtab

set hlsearch

set foldmethod=syntax
set foldlevelstart=20

" Configure for terminal of 256 color
set t_Co=256
set t_AB=[48;5;%dm
set t_AF=[38;5;%dm

syntax on

set laststatus=2 " Always show status line

set smartindent

set showcmd
set number
set ruler

set nowrap
set linebreak " No use when no wrap

" Airline setting
let g:airline_powerline_fonts = 1   " Set powerline font support for airline
let g:airline#extensions#tabline#enabled = 1

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let s:uname = system("echo -n \"$(uname)\"")
if s:uname == "Darwin"
    " Do Mac stuff here
    let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
endif

" Set highlight style for search
hi Search term=reverse cterm=bold ctermfg=7 ctermbg=5 guifg=Black guibg=Yellow

" set cursorline
" highlight CursorLine cterm=none ctermbg=237

" Set mouse support
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" Change cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Set extension map to filetype for CUDA
au BufNewFile,BufRead *.cu set ft=cu
au BufNewFile,BufRead *.cuh set ft=cu

" Set filetype specific setting
au FileType python setl shiftwidth=4 tabstop=4 expandtab
au FileType make setl noexpandtab

set background=dark
colorscheme smyck

command -nargs=* Make make <args> | cwindow 3

autocmd BufWritePre * :%s/\s\+$//e

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler_options = '-Wall -fopenmp -D__PATH__=""'
let g:syntastic_cpp_compiler_options = '-Wall -fopenmp -D__PATH__=""'

" let g:syntastic_shell = '/bin/bash'
