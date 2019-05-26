" Load vim default.
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" ====================================================================================================
" VIM-PLUG SETUP
" ====================================================================================================
" Specify a directory for plugins.
" - Avoid using standard Vim directory names like 'plugin'.
call plug#begin('~/.vim/plugged')

" Functional.
Plug 'scrooloose/nerdtree'                                      " File browser.
Plug 'Xuyuanp/nerdtree-git-plugin'                              " Git support for nerdtree.
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " Fuzzy finder.
Plug 'junegunn/fzf.vim'                                         " FZF commands for vim.
Plug 'mileszs/ack.vim'                                          " Search tool.
Plug 'w0rp/ale'                                                 " Asynchronous lint engine and language server client.
Plug 'airblade/vim-gitgutter'                                   " Git support in gutter.
Plug 'tpope/vim-fugitive'                                       " Git wrapper.
Plug 'tpope/vim-surround'                                       " Vim surround.
Plug 'tpope/vim-repeat'                                         " Enable repeating supported plugin maps with '.'.

" Visual.
Plug 'junegunn/seoul256.vim' " Color scheme.
Plug 'sheerun/vim-polyglot'  " Language syntax package.
Plug 'Yggdroot/indentLine'   " Indent line guide.

" Initialize plugin system.
call plug#end()

" ====================================================================================================
" PLUGINS SETUP
" ====================================================================================================
" Seoul256.
colo seoul256

" Vim fugitive.
set laststatus=2
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P\ %L

" FZF vim.
nnoremap <Leader>o :GFiles<CR>
nnoremap <Leader>O :Files<CR>
nnoremap <Leader>b :GFiles?<CR>
nnoremap <Leader>B :Buffers<CR>
nnoremap <Leader>w :Windows<CR>

" Ack vim Ag.
set shellpipe=&>
let g:ackprg='ag --vimgrep'
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>A :AckFile!<Space>

" Nerdtree.
let NERDTreeMapHelp='Z'       " Free up the ? search command.
let NERDTreeShowHidden=1      " Show hidden files.
let NERDTreeNaturalSort=1     " Sort node in natural order.
let NERDTreeSortHiddenFirst=1 " Show hidden file first.
let NERDTreeIgnore=['\.swp', '\.git$', '.DS_Store', 'Thumbs.db', 'desktop.ini']
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>t :NERDTreeFind<CR>

" Ale.
set completeopt=menu,menuone,noselect,noinsert " Fix autocomplete behavior.
set omnifunc=ale#completion#OmniFunc
let g:ale_linters_explicit=1
let g:ale_linters={
    \'html': ['htmlhint'],
    \'javascript': ['eslint'],
    \'json': ['jsonlint'],
    \'less': ['lessc'],
    \'php': ['php', 'langserver'],
    \'twig': ['htmlhint'],
\}
let g:ale_html_htmlhint_options='--config '.$HOME.'/.vim/.htmlhintrc.json'
let g:ale_php_langserver_executable=$HOME.'/.vim/vendor/bin/php-language-server.php'
nnoremap <silent> <Leader>f :ALEGoToDefinition<CR>
nnoremap <silent> <Leader>F :ALEGoToTypeDefinition<CR>
nnoremap <silent> <Leader>r :ALEFindReferences<CR>
nnoremap <silent> <Leader>h :ALEHover<CR>

" ====================================================================================================
" GENERAL SETUP
" ====================================================================================================
set hidden                   " Enabled buffer to be hidden.
set updatetime=1000          " 1 second update time for plugins and events that rely on it.
set number                   " Enabled number line.
set clipboard=unnamed        " Allow clipboard copy and paste.
set autoindent               " Enable auto-indentation.
set tabstop=4                " No. of spaces for tab in file.
set shiftwidth=4             " No. of spaces for step in autoindent.
set softtabstop=4            " No. of spaces for tab when editing.
set expandtab                " Expand tabs into spaces.
set smarttab                 " Smart tabulation and backspace.
set hlsearch                 " Highlight searched pattern.
set ignorecase               " Ignore case when searching.
set smartcase                " Case sensitive if searching with uppercase.
set nobackup                 " No backup.
set nowritebackup            " No write backup.
set nowrap                   " No word wraping.
set viminfo=!,'100,<50,s10,h " Viminfo settings.

" Change cursor when in insert mode.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" General auto command.
augroup GeneralAu
    autocmd!

    " Auto save.
    autocmd BufLeave,BufUnload,BufDelete * silent! :update

    " JSON general setups.
    autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Reload file that was changed outside of vim.
set autoread
augroup CheckFileDisk
    autocmd!
    autocmd CursorHold,CursorHoldI * checktime
augroup END

" Fix syntax highlight.
nnoremap <Leader>z :syntax sync fromstart<CR>

" Remove trailing white spaces.
nnoremap <silent> <Leader>x :%s/\s\+$//e<CR>

" Close quickfix and preview window.
nnoremap <silent> <Leader>c :ccl<CR><C-w>z

" Clear search.
nnoremap <silent> <Leader><space> :noh<CR>

" Search word in cursor without moving.
nnoremap * *``
nnoremap # #``

" CTRL-j and CTRL-k for autocomplete navigation.
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" CTRL-h, CTRL-j, CTRL-k, CTRL-l for quick vertical and horizontal navigation.
nnoremap <C-h> 6zh
nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>
nnoremap <C-l> 6zl
