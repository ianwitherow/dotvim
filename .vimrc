" Use pathogen to load plugins from bundle directory
filetype off
call pathogen#incubate()
call pathogen#helptags()

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

au BufNewFile,BufRead *.aspx,*.ascx set filetype=html

"turn off stupid bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let mapleader=','

set ai "autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab

set nu "Show line numbers

set incsearch "find results as you type
set ignorecase "ignore case when searching
set smartcase "override ignorecase when pattern contains a capital letter

"Start in full screen
set lines=999
set columns=999

au GUIEnter * simalt ~x
map <leader>F :simalt ~x<CR>

"have 0 go to first nonblank character
map 0 ^

set guifont=Consolas:h10

color codeschool

"Persist undo
set undodir=$TEMP
set undofile
set undolevels=5000

runtime macros/matchit.vim
autocmd BufNewFile,BufRead *.vb set ft=vbnet

"Treat all numbers as decimal
set nrformats=

nmap <space> zz

"Workaround because S doesn't work with indentation in visual studio
"nmap S ddO

"Double ESC turns off seach highlighting
nmap <ESC><ESC> :noh<CR>

"New lines while staying in normal mode
map <Enter> o<Esc>
map <S-Enter> O<Esc>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i

map <leader>te :tabedit 
map <leader>tm :tabmove 
map <leader>tl :tablast<CR>
map <leader>tf :tabfirst<CR>
map <leader>tn :tabnew<CR>

"Easy VIMRC editing
map <leader>rc :tabedit $MYVIMRC<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

"opening definitions
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Get rid of those annoying underlines in HTML
let html_no_rendering=1

"Set j and k to go down a line even on a wrapped line
nmap j gj
nmap k gk

"Y yanks from cursor to end of line
nnoremap Y y$

" move the current line up and down
nnoremap <leader>k      :m-2<CR>==
nnoremap <leader>j      :m+<CR>==
nnoremap <leader><Up>   :m-2<CR>==
nnoremap <leader><Down> :m+<CR>==

"Remove ^M characters visual studio likes to make
nnoremap <leader>dm		:%s/\r\(\n\)/\1/g<CR><C-o>


" move the word under the cursor left and right
nnoremap <leader>h       "_yiw?\v\w+\_W+%#<CR>:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o><C-l>:noh<CR>
nnoremap <leader>l       "_yiw:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o>/\v\w+\_W+<CR><C-l>:noh<CR>

" isolate a line
nnoremap <leader><space><space> O<c-o>j<c-o>o<c-o>k<esc>
"
"copy/paste to os clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P

"Paste in visual mode without overwriting the buffer
vnoremap p "_dp


"Quick file type changing
nnoremap <leader>ftj :set ft=javascript<CR>
nnoremap <leader>fth :set ft=html<CR>
nnoremap <leader>ftc :set ft=css<CR>
nnoremap <leader>ftx :set ft=xml<CR>
nnoremap <leader>fts :set ft=sql<CR>

"Break up html
vnoremap <leader>br mt:s/<[^>]*>/\r&\r/g<CR>`tdd=atvat:g/^$/d<CR>:noh<CR>}ddkvato<Esc>

"Split up HTML tag and put cursor inside
imap <C-Enter> <Enter><Esc>O
imap <S-Enter> <Enter><Esc>O

"HTML attribute text object
omap aha :normal vaha<CR>
vnoremap aha :<C-U>silent! normal! vf";<CR>


"turn off ~ file backup
set nobackup

autocmd! BufWritePost .vimrc source $MYVIMRC

"Fix closetag
"let g:closetag_html_style=1
"au Filetype html,xml,xsl source ~/.vim/vim73/scripts/closetag.vim

