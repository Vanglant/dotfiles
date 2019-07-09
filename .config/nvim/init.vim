" Coc Configuration
set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300
set shortmess+=c

set signcolumn=yes

set number
set relativenumber

syntax on
filetype plugin on
filetype indent on

" set clipboard=unnamedplus

set ts=4
set sw=4
set wrap
set encoding=utf-8
set fileencoding=utf-8

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

" Move between splits
nnoremap <C-J> <C-W><C-J>

nnoremap <C-K> <C-W><C-K>

nnoremap <C-L> <C-W><C-L>

nnoremap <C-H> <C-W><C-H>

" Theme config
set termguicolors
colorscheme NeoSolarized
set background=dark

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" fzf settings
" This is the default extra key bindings
"
 let g:fzf_action = {
   \ 'ctrl-t': 'tab split',
     \ 'ctrl-x': 'split',
       \ 'ctrl-v': 'vsplit' }

 nnoremap <C-f> :Files<Cr>
 nnoremap <C-g> :Rg<Cr>

"       " Default fzf layout
"       " - down / up / left / right

let g:fzf_layout = { 'down': '~40%'  }

"       " In Neovim, you can set up fzf window using a Vim command
"
let g:fzf_layout = { 'window': 'enew'  }
let g:fzf_layout = { 'window': '-tabnew'  }
let g:fzf_layout = { 'window': '10new'  }

"" Customize fzf colors to match your color scheme

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
"
" " CTRL-N and CTRL-P will be automatically bound to next-history and
" " previous-history instead of down and up. If you don't like the change,
" " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"" Coc settings

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
 inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at
" current position.
" Coc only does snippet and additional edit on confirm.
 inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
 nmap <silent> [c <Plug>(coc-diagnostic-prev)
 nmap <silent> ]c <Plug>(coc-diagnostic-next)

 " Remap keys for gotos
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
 nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')

 	else
     		call CocAction('doHover')

       	endif
endfunction

"               " Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
"               " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"               " Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
autocmd!
"                   " Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"                         " Remap for do codeAction of selected region,
" ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
"                         " Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
"                         " Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
"                         " Use <tab> for select selections ranges, needs
"                         server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"                         " Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
"                         " Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
"                         " use `:OR` for organize import of current
"                         buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
"                         " Using CocList
"                         " Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"                         " Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"                         " Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"                         " Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"                         " Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"                         " Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"                         " Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"                         " Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-startify'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install/ --all'}
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'tpope/vim-surround'

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

call plug#end()
