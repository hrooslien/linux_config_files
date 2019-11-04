" setup Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" " call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jnurmine/Zenburn'
Plugin 'flazz/vim-colorschemes'
" IGNORANT Plugin 'vim-scripts/indentpython.vim'
Plugin 'python-rope/ropevim'
Plugin 'davidhalter/jedi-vim'
" IGNORANT Plugin 'SirVer/ultisnips'
" IGNORANT Plugin 'honza/vim-snippets'
" IGNORANT Plugin 'tpope/vim-fugitive'
" IGNORANT Plugin 'w0rp/ale'
" IGNORANT Plugin 'sheerun/vim-polyglot'
" IGNORANT Plugin 'ludovicchabant/vim-gutentags'
" IGNORANT Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" IGNORANT Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
" IGNORANT Plugin 'vim-airline/vim-airline'
" IGNORANT Plugin 'vim-airline/vim-airline-themes'
" IGNORANT Plugin 'airblade/vim-gitgutter'
" IGNORANT Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" some things people say are generally good
set number
set relativenumber
set encoding=utf-8
syntax enable " highlight special words to aid readability

" With both on, searches with no capitals are case insensitive, while searches with a capital characters are case sensitive.
set smartcase
set ignorecase

" where new vim pane splits are positioned
set splitbelow
set splitright

" vim split navigations working with tmux (ctrl+h,j,k,l)
if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
endif

" vim remaps
" add blank lines without entering insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" Theme options
set t_Co=256
" set background=dark
" colorscheme solarized
colorscheme zenburn

""" Hilight search and set numbers
set incsearch " show matches for patterns while they are being typed
set hlsearch " highlight all matches for searched pattern
"""" clear highlight with <esc> after a search
nnoremap <C-o> :noh<return>

" increase the PEP8 max characters
set cc=90

" Airline configuration
" IGNORANT let g:airline#extensions#tabline#enabled = 1
" IGNORANT let g:airline#extensions#tabline#formatter = 'default'

" Nerdtree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Switching between buffers
" Set commands to switching between buffers
:nnoremap <Tab> :bnext!<CR>
" IGNORANT :nnoremap <S-Tab> :bprevious!<CR>
" IGNORANT :nnoremap <C-X> :bp<bar>sp<bar>bn<bar>bd<CR>

" file searchs
" IGNORANT map <c-p> :files<cr>

" ale configuration
"""" better formatting fo worp/ale
" IGNORANT let g:ale_echo_msg_error_str = 'e'
" IGNORANT let g:ale_echo_msg_warning_str = 'w'
" IGNORANT let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
" IGNORANT let g:ale_completion_enabled = 1
""" Customize linters that are turned on
" IGNORANT let g:ale_linters = {
	" IGNORANT \   'python': ['flake8'],
	" IGNORANT \}
" IGNORANT let g:ale_set_highlights = 0

" Fix keys
" IGNORANT set backspace=2

" IGNORANT let g:UltiSnipsExpandTrigger='<tab>'
" IGNORANT let g:UltiSnipsListSnippets='<c-tab>'
" IGNORANT let g:UltiSnipsJumpForwardTrigger='<c-j>'
" IGNORANT let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" IGNORANT nmap <F8> :TagbarToggle<CR>

" add PEP8 indentation
au BufNewFile,BufRead *.py " apparently this will only apply to .py files
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	" \ set textwidth=79
	\ set expandtab " expand tabs into spaces
	\ set autoindent
	\ set fileformat=unix " avoid conversion issues when checking into GitHub and/or sharing with other users.
	\ set showmatch " show the matching part of the pair for [] {} and ()
	\ let python_highlight_all = 1 " enable all Python syntax highlighting features


