set number                     " Line numbers
set linebreak                  " Break line without break word
set linespace=2
set nobackup                   " Dont save backup~ files
set ignorecase                 " Ignore case when searching
set smartcase                  " Override ignorecase when pattern contains a capital letter
set incsearch                  " Find results as you type
set ai                         " Autoindent
set copyindent
set backspace=indent,eol,start " Visual studio backspace thing for the extensiont
set shiftwidth=3 tabstop=3     " Uses less real estate than 4
set noexpandtab                " Don't use spaces
set guioptions-=m              " Remove menu
set guioptions-=T              " Remove toolbar
set guioptions-=r              " Remove scroll bar
set directory=~/.vim/swp       " Put .swp files here
set nrformats=                 " Treat all numbers as decimal
set lazyredraw                 " When running macros, wait until it's done and then update the screen. way faster
set noshowmatch
set hidden                     " Allow switching buffers even if it's not saved yet
set rnu                        " relative line numbers
set nohlsearch                 " Don't highlight search queries

set guifont=Monaco\ for\ Powerline:h10:cANSI

let mapleader=','

"Syntax highlighting
syntax on

"Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim.git'
Plugin 'chrisbra/csv.vim.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'docunext/closetag.vim.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'mjbrownie/swapit.git'
Plugin 'bling/vim-airline.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'bkad/CamelCaseMotion.git' "use ,<motion> to move in camelcase
Plugin 'tmhedberg/matchit.git'
Plugin 'scrooloose/nerdtree.git' "File browsing
Plugin 'atweiden/vim-vmath.git' "Lets you do <leader>+ to math some numbers
Plugin 'mattn/emmet-vim.git' "New zen-coding
Plugin 'godlygeek/tabular.git'
Bundle 'tpope/vim-markdown'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gregsexton/MatchTag'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'groenewege/vim-less'
Plugin 'morhetz/gruvbox' "colorscheme
Plugin 'mbbill/undotree'

"Bundle "daylerees/colour-schemes", { "rtp": "vim/" }

call vundle#end()

colorscheme gruvbox

filetype plugin indent on


"" Use pathogen to load plugins from bundle directory
"filetype off
"call pathogen#incubate()
"call pathogen#helptags()
"filetype plugin indent on


"Auto commands

"ASP.NET files that should act like HTML
au BufNewFile,BufRead *.aspx,*.ascx,*.master,*.cshtml set filetype=html

"Start in full screen
au GUIEnter * simalt ~x

"For some reason I have to manually load the css color script
au Filetype html,css source ~\.vim\after\syntax\css.vim

"Allows % to move between braces in inline css
au filetype html let b:match_debug=1

"Fixes brace matching in script tags inside HTML files
"let b:match_debug=1

"Load .vimrc after saving it
au! BufWritePost .vimrc source $MYVIMRC


"turn off stupid bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"_____________________________________________________
"----------------------Mappings-----------------------
"_____________________________________________________

"Have 0 go to first nonblank character
nmap 0 ^

"Space centers the screen
nmap <space> zz

"Double ESC turns off seach highlighting
nmap <silent> <ESC><ESC> :noh<CR>

"Save with Ctrl+S for when I want to save with one hand
nmap <c-s> :w<cr>

"Ctrl-L unhighlights as well as redraws the screen
nnoremap <silent> <c-l> :noh<cr>:redraw<cr>

"New lines while staying in normal mode
nmap <Enter> o<Esc>
nmap <S-Enter> O<Esc>

"Set j and k to go down a line even on a wrapped line
nmap j gj
nmap k gk

"Make empty lines ACTUALLY empty (removes lines with just whitespace)
nmap <leader>dws :%s/^\s*$//g<CR>:noh<cr>``

"Delete empty lines
nmap <leader>dbl :g/^\s*$/d<cr>``

nmap <leader>ddbl :g/\(^\s*$\n\)\{2}/normal dd<cr>``

"Vimath plugin - does some math stuff on lists of numbers
vmap <leader>+ y:call VMATH_Analyse()<cr>
nmap <leader>+ vip++

"Open a new tab
nmap <leader>tn :tabnew<CR>

"Easy VIMRC editing
map <leader>rc :edit $MYVIMRC<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

"Open current file location in windows explorer
map <leader>ex :silent ! "explorer /select, %<cr>"
"Open current file location in chrome
map <leader>chr :silent !"chrome %<cr>"


"Get rid of those annoying underlines in HTML
let html_no_rendering=1

"Set a URL to autoversion (.net)
map <leader>av cs"@i"<%=%><esc>F=aNew AutoVersion("<esc>f/dt@F";Pf)a.Write()<esc>f@df@

"Tableify the document (using tab as the delimiter), then copy it to clipboard
"map <leader>ft :%Tableize/\t<cr>ggyyppVr-gg.yyGpgg"*yG
map <leader>ft :%Tableize/\t<cr>:TableModeEnable<cr>ggo\|\|<esc>yyggPGpgg"*yG

"Y yanks from cursor to end of line
nnoremap Y y$

" move the current line up and down
nnoremap <leader>k      :m-2<CR>==
nnoremap <leader>j      :m+1<CR>==

"Remove ^M characters visual studio likes to make
nnoremap <leader>dm		:%s/\r\(\n\)/\1/g<CR>``

" isolate a line
nnoremap <leader><space><space> O<c-o>j<c-o>o<c-o>k<esc>

"copy/paste to os clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P
nnoremap <Leader>d "*d
vnoremap <Leader>d "*d
nnoremap <Leader>D "*D

"Paste in visual mode without overwriting the buffer
vnoremap p "_dp
vnoremap P "_dP

"Quick file type changing
nnoremap <leader>ftj :set ft=javascript<CR>
nnoremap <leader>fth :set ft=html<CR>
nnoremap <leader>ftc :set ft=css<CR>
nnoremap <leader>ftx :set ft=xml<CR>
nnoremap <leader>fts :set ft=sql<CR>

"Break up html
vnoremap <leader>br mt:s/<[^>]*>/\r&\r/g<CR>`tdd=atvat:g/^$/d<CR>:noh<CR>}ddkvato<Esc>

"Format JSON and JS
nnoremap <Leader>fj :%!python -m json.tool<CR>
nnoremap <Leader>fjs :call JsBeautify()<cr>

nnoremap <leader>fx :set filetype=xml<cr>:%s/</\r</g<CR>:%s/>/>\r/g<CR>:g/^$/d<CR>gg=G

"Fix js comments. Turns //This  into  // This
"Make sure a colon isn't before the slashes since that's probably a url

"nnoremap <leader>fc :%s#\([^:]\?\)//\([^\s]\)#\1// \2<CR>``
nnoremap <leader>fc :%s#:\@<!\/\/\([^ ]\)#// \1<CR><C-o>


"Split up HTML tag and put cursor inside (Used when cursor is like this: <div>|</div>)
imap <S-Enter> <Enter><Esc>O

"HTML attribute text object
omap aha :normal vaha<CR>
vnoremap aha :<C-U>silent! normal! vf";<CR>

"Copy the entire lines when grabbing html tags
nnoremap yat yVat``

"Sideways.vim - move parameters inside a method left or right
nnoremap <leader>h :SidewaysLeft<cr>
nnoremap <leader>l :SidewaysRight<cr>
"Create 'argument' text object - a
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

"UndoTree
nnoremap <F5> :UndotreeToggle<cr>

"Markdown preview
nmap <leader>md :%!c:\users\ian.witherow\.vim\Markdown.pl --html4tags <cr>

"_____________________________________________________
"----------------------End of Mappings-----------------------
"_____________________________________________________


"Persist undo
let undo_dir = $TEMP."\\vimundo"
if !isdirectory(undo_dir)
	silent execute "!mkdir ".undo_dir
endif
set undodir=$TEMP\vimundo "not sure how to use the variable I made here
set undofile
set undolevels=5000


runtime macros/matchit.vim


"Ctrl-P stuff
"Ctrl+B opens CtrlP Buffer
nnoremap <silent> <c-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'c'

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|\v[\/]\.(git|hg|svn|swo|swp)$'

"Gets a bunch of lines ready to be inserted into a table in sql
nnoremap  <leader>sql :call Sql()<cr>

"Generates VB public properties from private ones
let @v = 'mmyyGpcePublic Propertyf_xAGet€ýc€ýbEnd Get>>O	Return _?properwye/_pjoSetEnd Set>>O	_" = valuekA(value as?properwwwy$/as)ea "jjo€kbEnd Property`mj'

"Macro for splitting up sql inserts when you have over 1,000 records. Used in
"the Sql() function
let @s = '0xOinsert into ##SomeTable values1001j0'

":TOhtml options
let g:html_use_css = 1 "Use CSS instead of inline styles on each tag
let g:html_number_lines = 0 "Don't include line numbers


"For vim-airline
set encoding=utf-8 " Necessary to show Unicode glyphs
set laststatus=2
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='solarized'

"BetterDigraphs
inoremap <expr>  <C-K>   BDG_GetDigraph()

"NerdTree stuff
map <F2> :NERDTreeToggle<CR>

if &term =~ "cygwin" || &term =~ "win32"
endif



function! FixBrackets()
	" Pulls up brackets that are on their own line
	" javascript
	silent :g/)$\n{/normal! J
	silent :g/)$\n\s.\{-}{/normal! J

	"css
	silent :g/[a-z]$\n{/normal J
	silent :g/)$\n{/normal J
	silent :g/[a-z]$\n\s.{-}{/normal J
	silent :g/[a-z]$\n^\s\+{/normal J
	silent :g/)$\n^\s\+{/normal J

endfunction

"Format document with HTML then open it in chrome
function! ToHtml()
	silent :colorscheme solarized
	silent :set background=light
	:TOhtml
	:w
	silent :!chrome %
	:q
endfunction

function! Sql()
	call inputsave()
	let tableName = input('Table name: ')
	call inputrestore() 

	silent

	if tableName == ""
		echo "Aborted"
		return
	endif

	let tableField = ""

	call inputsave()
	let createTable = input('Create table? (y/n): ')
	call inputrestore() 
	if createTable == "y"
		call inputsave()
		let tableField = input('Field name: ')
		call inputrestore() 
	endif

	silent :execute "set filetype=sql"

	"Remove blank lines
	silent :execute ":g/^$/d"

	silent :execute "%s/^/,('/g"
	silent :execute "%s/$/')/g"
	silent :execute "noh"
	silent :execute "normal! gg"
	let timeout = 5
	let current = 0

	"Command to write the insert sql statement. Go to beginning of line,
	"delete the comma, insert new line above, write insert statement.
	"Finally, go 1001 lines down since SQL inserts cap at 1000
	let insertSql = 'normal 0xOinsert into ' . tableName . ' values1001j0'

	silent :execute insertSql
	let curline = line('.')
	if curline != line('$')
		while curline + 1 != line('$') && curline != line('$')
			let current += 1
			let curline = line('.')
			if curline != line('$')
				silent :execute insertSql
			endif
		endwhile
	endif

	if tableField != ""
		:execute "normal! gg"
		let sql = "create table " . tableName . " (". tableField ." varchar(500))"
		:execute "normal! O"
		call setline('.', sql)
	endif

	:execute "normal! gg"
	normal! "*yG
endfunction

function! FormatSchedule()
	call inputsave()
	let monthNumber = input('Month #: ')
	let year = input('Year: ')
	call inputrestore() 

	"remove blank days (lines with just a number and a blank line beneath)
	silent :execute "%s/^\\d\\+$\\n\\n//g"
	"Remove lines with just her name
	silent :execute ":g/Brianna Witherow/d"
	"Remove blank lines
	:execute ":g/^\s*$/d"
	"Go to top of file
	:execute "normal! gg"

	let current = 0
	let curline = line('.')
	if curline != line('$')
		while curline + 1 != line('$') && curline != line('$')
			let current += 1
			let curline = line('.')
			if curline != line('$')
				:execute "normal! I".monthNumber."/"
				:execute "normal! A/".year." at"
				:execute "normal! J"
				:execute "normal! f x"
				:execute "normal! f-s to "
				:execute "normal! f xj"
			endif
		endwhile
	endif
	"Go to top of file
	:execute "normal! gg"

endfunction
