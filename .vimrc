" ------ Basic settings --------"
set encoding=utf-8
set number
set relativenumber
set tabstop=4 shiftwidth=4 softtabstop=4
syntax on

" Set search highlighting
set hlsearch
set incsearch

" Clear highlights
nnoremap <silent> <BS> :noh<CR>

" Alternative escape in insert mode
inoremap jk <Esc>

if has('persistent_undo')
	set undolevels=10000
	set undoreload=50000
	set undodir=$HOME/.VIM_UNDO_FILES
	set undofile
endif
set history=2000 " change history to 1000

" Set num keystrokes before swap rotation
set updatecount=10

" Tab Control
set smarttab " tab respects 'tabstop'. 'shiftwidth', and 'softtab'

" Faster saving from insert mode
inoremap ;w <Esc>:w<CR>
nnoremap ;w :w<CR>  
inoremap ZZ <Esc>:x
inoremap ZQ <Esc>ZQ

"------ Function Key Mappings ----"
" Toggle paste mode
set pastetoggle=<F2>
" Remove trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" -------Map a leader key ------"
let mapleader = ','
let maplocalleader = "\\"
nnoremap <leader><leader> ,

" Easier split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Firefox-like tab navigation
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

"-------- Plugins -------------"
call plug#begin('~/.vim/plugged')
" File Management
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy find serarching

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Status line
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter' " Show git diff in stataus line

" Navigation
Plug 'christoomey/vim-tmux-navigator'

" Utility and Convience
Plug 'godlygeek/tabular' " Aligning text on multiple lines
Plug 'chip/vim-fat-finger'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'cgathuru/snips'
Plug 'tpope/vim-fugitive' " Git wrapper

" Syntax Checking
Plug 'scrooloose/syntastic'

" Python Plugins
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
call plug#end()

filetype plugin indent on
" -------- Plugin Configuration ----------"

" Airline settings
set laststatus=2 " Statusline always on
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'

" Ctrlp Settings
let g:ctrlp_working_path_modee = 'ra'
let g:ctrlp_root_markers = ['.vimrc'] "Use vimrc if .git not found
let g:ctrlp_cmd = 'CtrlPMixed' "Search buffer+mru+files by default
let g:ctrlp_by_filename = 1 "Search by filenames

" YCM Settings
let g:ycm_autoclose_preview_window_after_completetion = 1
let g:ycm_key_list_select_completion = ['<Enter>', '<DOWN>']
let g:ycm_key_list_previous_completion = ['<UP>']
let g:ycm_python_binary_path='python'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in strings

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Ultisnips Settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/projects/snips/UltiSnips"
nnoremap <leader>ue :UltiSnipsEdit<CR>

" ----- Filetype Settings --------
set wildignore+=*.pyc " Ignore python compiled files

augroup html
	au!
	au BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Diable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" ---- Customizations ---------
set tags+=~/.tags/tags
" vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>:noh<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:noh<cr>

inoremap zz <Esc>zza
nnoremap <silent> <CR> o<Esc>k " Insert blank line below

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line.
noremap Y y$

" Make Ctrl-e jump to the end of the current line in insert mode
inoremap <C-e> <C-o>$

vnoremap <Leader>s :sort<CR>

if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif


let g:last_relative_dir = ''
nnoremap <localleader>m  :call RelatedFile ("models.py")<cr>
nnoremap <localleader>v  :call RelatedFile ("views.py")<cr>
nnoremap <localleader>u  :call RelatedFile ("urls.py")<cr>
nnoremap <localleader>a  :call RelatedFile ("admin.py")<cr>
nnoremap <localleader>te  :call RelatedFile ("tests.py")<cr>
nnoremap <localleader>t  :call RelatedFile ( "templates/" )<cr>
nnoremap <localleader>tt  :call RelatedFile ( "templatetags/" )<cr>
nnoremap <localleader>ma  :call RelatedFile ( "management/" )<cr>
nnoremap <localleader>s  :e settings.py<cr>
nnoremap <localleader>gu  :e urls.py<cr>

"This is to check that the directory looks djangoish
fun! RelatedFile(file)
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

if !exists("*SetAppDir")
	fun SetAppDir()
		if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
			let g:last_relative_dir = expand("%:h") . '/'
			return ''
		endif
	endfun
endif

augroup django_setup
	au!
	autocmd BufEnter *.py call SetAppDir()
augroup END
