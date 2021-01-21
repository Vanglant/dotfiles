" syntax off
" Ported settings from old config
"
set lazyredraw
set guifont="Jetbrains Mono":h11

" UI
" set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"" Theme config
set t_Co=256

" General editor config
set noerrorbells
set visualbell
set history=1000
set undolevels=1000

" Terminal/GUI/Font settings
scriptencoding utf-8
set encoding=utf-8 " The encoding displayed
set fileencoding=utf-8 " The encoding written to file
set showcmd
set number relativenumber

set list
set listchars=trail:·,tab:>-,nbsp:␣

" Indentation
"""""""""""""""""""""""""""""""""""""""
" Global configuration
set expandtab                     " Transform kitten killer tabs to spaces
set tabstop=4                     " Number of visual spaces per tab
set shiftwidth=4                  " Number of spaces to use for autoindent
set backspace=indent,eol,start    " Allow backspacing over everything in
                                  " insert mode
set autoindent                    " Always set autoindent on
set copyindent                    " Copy the previous indentation on autoindent
set shiftround                    " Use n shiftwidth when indenting with <>
set smarttab                      " Use smart removal when using tabs
set nojoinspaces     

set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
set wildmenu

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect		

set history=500
set nobackup
set nowb
set noswapfile

" Search
""""""""""""""""""""""""""""""""""""""
set ignorecase
set incsearch
set smartcase

set clipboard+=unnamedplus
set grepprg=rg\ --vimgrep

" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin on
filetype indent on

set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one
set showmatch
set hidden
set hlsearch
set mousehide

inoremap jk <esc>

lua require('plugins')

lua require("colorbuddy").colorscheme("gruvbox")

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" -------------------- GalaxyLine -------------------------
lua require('eviline')
" -------------------- Treesitter -------------------------
lua <<EOF
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    require'nvim-treesitter.configs'.setup{
        highlight = {
            enable = true
        }
    }
EOF
" -------------------- LSP ---------------------------------
lua <<EOF
    local pid = vim.fn.getpid()
    local choco_bin_dir = os.getenv ('USERPROFILE') .. '\\scoop\\apps\\omnisharp\\current\\'
    local omnisharp_bin = choco_bin_dir .. 'OmniSharp.exe'
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local nvim_lsp = require('lspconfig')
    nvim_lsp.omnisharp.setup{
        cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
        on_attach = require'completion'.on_attach
    }
    nvim_lsp.clangd.setup{
        on_attach = require'completion'.on_attach
    }
EOF

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

set signcolumn=yes

let mapleader = "\<Space>" 

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>


