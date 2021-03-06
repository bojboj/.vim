" ====================================================================================================
" VIM-PLUG SETUP
" ====================================================================================================
call plug#begin('~/.vim/plugged')

" Functional.
Plug 'scrooloose/nerdtree'                                      " File browser.
Plug 'Xuyuanp/nerdtree-git-plugin'                              " Git support for nerdtree.
Plug 'airblade/vim-gitgutter'                                   " Git support in gutter.
Plug 'tpope/vim-fugitive'                                       " Git wrapper.
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " Fuzzy finder.
Plug 'junegunn/fzf.vim'                                         " FZF commands for vim.
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}     " Asynchronous completion.
Plug 'w0rp/ale'                                                 " Asynchronous lint engine and language server client.

" Visual.
Plug 'editorconfig/editorconfig-vim' " For defining coding styles per project.
Plug 'junegunn/seoul256.vim'         " Color scheme.
Plug 'sheerun/vim-polyglot'          " Language syntax package.
Plug 'Yggdroot/indentLine'           " Indent line guide.

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

" Editor config.
" To ensure that this plugin works well with Tim Pope's fugitive.
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" FZF vim.
nnoremap <Leader>o :GFiles<CR>
nnoremap <Leader>O :Files<CR>
nnoremap <Leader>b :GFiles?<CR>
nnoremap <Leader>B :Buffers<CR>

" Nerdtree.
let NERDTreeShowHidden=1      " Show hidden files.
let NERDTreeNaturalSort=1     " Sort node in natural order.
let NERDTreeSortHiddenFirst=1 " Show hidden file first.
let NERDTreeIgnore=['\.swp', '\.git$', '.DS_Store', 'Thumbs.db', 'desktop.ini']
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>t :NERDTreeFind<CR>

" deoplete
let g:deoplete#enable_at_startup=1

" Ale.
set completeopt=menu,menuone,noselect,noinsert " Fix autocomplete behavior.
set omnifunc=ale#completion#OmniFunc
let g:ale_linters_explicit=1
let g:ale_linter_aliases = {'html': ['html', 'javascript']}
let g:ale_linters={
    \'html': ['htmlhint', 'eslint'],
    \'javascript': ['eslint'],
    \'json': ['jsonlint'],
    \'less': ['lessc'],
    \'php': ['php', 'langserver'],
\}
let g:ale_html_htmlhint_options='--config '.$HOME.'/.vim/.htmlhintrc.json'
let g:ale_html_htmlhint_executable=$HOME.'/.vim/node_modules/.bin/htmlhint'
let g:ale_javascript_eslint_options='--ext .js,.html --resolve-plugins-relative-to='.$HOME.'/.vim'
let g:ale_javascript_eslint_executable=$HOME.'/.vim/node_modules/.bin/eslint'
let g:ale_json_jsonlint_executable=$HOME.'/.vim/node_modules/.bin/jsonlint'
let g:ale_less_lessc_executable=$HOME.'/.vim/node_modules/.bin/lessc'
let g:ale_php_langserver_executable=$HOME.'/.vim/vendor/bin/php-language-server.php'
nnoremap <silent> <Leader>f :ALEGoToDefinition<CR>
nnoremap <silent> <Leader>F :ALEGoToTypeDefinition<CR>
nnoremap <silent> <Leader>r :ALEFindReferences<CR>
nnoremap <silent> <Leader>h :ALEHover<CR>
nnoremap <silent> ]x :ALENext<CR>
nnoremap <silent> [x :ALEPrevious<CR>

" ====================================================================================================
" GENERAL SETUP
" ====================================================================================================
set hidden                   " Enabled buffer to be hidden.
set number                   " Enabled number line.
set ignorecase               " Ignore case when searching.
set smartcase                " Case sensitive if searching with uppercase.
set nowrap                   " No word wraping.
set updatetime=1000          " 1 second update time for plugins and events that rely on it.
set clipboard=unnamedplus    " Allow clipboard copy and paste.
set mouse=a                  " Mouse support.
set scrolloff=5              " Show a few lines of context around the cursor.

" Fix syntax highlight.
nnoremap <Leader>z :syntax sync fromstart<CR>

" Remove trailing white spaces.
nnoremap <silent> <Leader>x :%s/\s\+$//e<CR>

" Clear search.
nnoremap <silent> <Leader><space> :noh<CR>

" Search word in cursor without moving.
nnoremap * *``
nnoremap # #``

" CTRL-h, CTRL-j, CTRL-k, CTRL-l for quick vertical and horizontal navigation.
nnoremap <C-h> 6zh
nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>
nnoremap <C-l> 6zl
