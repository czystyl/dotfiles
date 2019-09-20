call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Function argument completion for Deoplete
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Bottom bar with all settings
Plug 'itchyny/lightline.vim'

"Bracket maps
Plug 'tpope/vim-unimpaired'

" Javascript
Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'leafgarland/typescript-vim'

" Graphql
Plug 'jparise/vim-graphql'

" ReasonML https://github.com/reasonml-editor/vim-reason-plus
Plug 'reasonml-editor/vim-reason-plus'

"Language Client https://github.com/autozimu/LanguageClient-neovim#quick-start
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" JS
Plug ‘ternjs/tern_for_vim’, { ‘do’: ‘npm install && npm install -g tern’ }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'dikiaap/minimalist'

call plug#end()

" JS
set background=dark
set termguicolors
let g:quantum_italics=1
colorscheme quantum

let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open nvim on startup
autocmd VimEnter * NERDTree

let g:deoplete#enable_at_startup = 1
set completeopt-=preview
