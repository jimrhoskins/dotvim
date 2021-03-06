"let g:Powerline_symbols = 'fancy'
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden

set nocompatible

set number
set ruler
syntax on

filetype off

filetype on

let maplocalleader=","
" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn off highlight after search
map <Leader>nh :silent noh<CR>
map <Leader>p :set paste!<CR>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
map <Leader>b :BufExplorer<CR>
" Command-T configuration
let g:CommandTMaxHeight=14

" CTags
"map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


" DASM ASM
au BufRead,BufNewFile *.dasm setfiletype asm

if has("autocmd")
  filetype plugin indent on
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make uses real tabs
au FileType make                                     set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" Coffeescript
au BufRead,BufNewFile *.coffee set ft=coffee

"json
au BufRead,BufNewFile *.json set ft=javascript

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" No highlight after search
map <Leader>nh :nohlsearch<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

map <Leader>v :YRShow<CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color desert

imap jj <Esc>

" Directories for swp files
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
end

"
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" Ruby.vim settings
imap <S-CR>    <CR><CR>end<Esc>-cc

color xoria256

au BufNewFile,BufRead *.jbuilder	set filetype=ruby

"let g:Powerline_symbols = 'fancy'
"python from powerline.bindings.vim import source_plugin; source_plugin()

"set rtp+=/usr/local/powerline/lib/python2.7/site-packages/powerline/bindings/vim

"eco support for ect
au BufNewFile,BufRead *.ect setfiletype eco
au BufNewFile,BufRead *.hbs setfiletype html
au BufNewFile,BufRead *.ejs setfiletype html

au BufNewFile,BufRead *.eye setfiletype ruby


let g:airline_theme='badwolf'
let g:airline#extensions#tagbar#enabled = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep='┣'
let g:airline_right_sep='┫'

let g:go_fmt_command = "gofmt"
" badwold
" bubblegum - muted green
" power linish- std
