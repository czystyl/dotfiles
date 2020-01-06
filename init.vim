call plug#begin('~/.vim/plugged')

" Ocaml
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/let-def/ocp-indent-vim'
Plug 'https://github.com/w0rp/ale.git'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/copy/deoplete-ocaml'
Plug 'https://github.com/sbdchd/neoformat'

" If using Vim-Plug (recommended. Install from https://github.com/junegunn/vim-plug)
Plug 'reasonml-editor/vim-reason-plus'

Plug 'jordwalke/vim-reasonml'
" If using vim-plug, install syntastic:
Plug 'scrooloose/syntastic'
Plug 'lifepillar/vim-mucomplete'

" nerd Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Function argument completion for Deoplete
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Bottom bar with all settings
Plug 'itchyny/lightline.vim'

"Bracket maps
Plug 'tpope/vim-unimpaired'

"https://github.com/autozimu/LanguageClient-neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" nice to have
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/czystyl/reason-language-server'],
    \ }

let g:deoplete#enable_at_startup = 1
set completeopt-=preview
set number

" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open nvim on startup
autocmd VimEnter * NERDTree

" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

" Esy and reason project
let g:mucomplete#can_complete = {}
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {'default': ['omni']}
let g:airline_extensions = ['esy', 'reason']
let g:reasonml_project_airline=1
let g:reasonml_syntastic_airline=1
let g:reasonml_clean_project_airline=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" NOT WORKING WITH REASON FILES
" Merlin 
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 1
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1


let g:ale_linters = {
\   'ocaml':      ['merlin'],
\}

let g:ale_fixers = {
\   'ocaml':      ['ocamlformat'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}



nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<cr>
autocmd FileType reason map <buffer> <D-M> :ReasonPrettyPrint<Cr>
