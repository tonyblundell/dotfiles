" Pretty defaults for syntax highlighting and indentation
syntax on
filetype plugin indent on

" Move up and down on a linewise basis instead of around wrapped lines
nmap j gj
nmap k gk

" Nice defaults for searching
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

" Tab/spaces defaults
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab

" Line numbers
set number

" Crosshair
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=236
highlight CursorColumn ctermbg=236

" Marker at 80 chars
if exists("&colorcolumn")
    set colorcolumn=80
    highlight ColorColumn ctermbg=236
endif

" Switch bindings for 0 and ^ - as 0 is easier to hit than ^
noremap 0 ^
noremap ^ 0

" Relative line numbers
set rnu

" Bind shortcut keys for quickfix list navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]Q :clast<CR>
nnoremap [Q :cfirst<CR>

" Set scrolloff to always show 10 lines of content around cursor
set scrolloff=10

" Statusline configuration
set laststatus=2                                    " Always visible
set statusline+=%F\                                 " Filename
set statusline+=%M\                                 " Modified flag
set statusline+=%=\                                 " Left/right separator
set statusline+=%v:%l                               " Cursor x:y
