" General config, better formatting pending
"
    let mapleader="," 
    let g:mapleader="," 

    set number " hybrid line number config
    set relativenumber "" hybrid line number config
    
    syntax on
    filetype plugin on
    filetype indent on

    set autoread " file changed from the outside
    set wildmenu " Turn on the Wild menu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
    else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    endif

    " Ignore case when searching
    set ignorecase

    " Highlight search results
    set hlsearch

    " Makes search act like search in modern browsers
    set incsearch 

    " Don't redraw while executing macros (good performance config)
    set lazyredraw 

    " For regular expressions turn magic on
    set magic
    " When searching try to be smart about cases 
    set smartcase

    set guifont= Fira\ Code:h10

    set bs=2 " allow backspacing over everything in insert mode
    set showmatch " show matching brackets
    set nocompatible " Use vim defaults
    set hidden " This option allows you to switch between multiple buffers without saving a changed buffer
    set hlsearch " Switch on search pattern highlighting.
    set mousehide " Hide the mouse pointer while typing.
    
    " Can be improved
    set clipboard=unnamed

    " Set history size to maximum
    set history=500

    " Change directory to working directory
    auto BufEnter * call CHANGE_CURR_DIR()

    set ts=4 " tabstop - how many colums should the cursor move for one tab
    set sw=4 " shiftwidth - how many columns should the text be indented
    set wrap " wraps long lines
    set encoding=utf-8 " The encoding displayed
    set fileencoding=utf-8 " The encoding written to file

    " Enable 256 colors palette in Gnome Terminal
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif

    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs ;)
    set smarttab

    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>

    " 1 tab == 4 spaces
    set shiftwidth=4
    set tabstop=4
    €ý,€ý,
    " Use Unix as the standard file type
    set ffs=unix,dos,mac
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile

    set background=dark
    colorscheme gruvbox

    set vb t_vb= " stop beeping or flashing the screen
    set laststatus=2 " Show the status line even if only one file is being edited
    set ruler " Show ruler
    set go=c " Following line removes the toolbar, As I usually dont need it.  Gives me extra lines for editor. If you have big monitor and you think you need toolbar, comment this line.


    
    if version >= 700
        " show buffer number in status line - http://stackoverflow.com/questions/5547943/display-number-of-current-buffer
        " Status Line Configuration {  
                set laststatus=2                             " always show statusbar  
                set statusline=  
                set statusline+=%-10.3n\                     " buffer number  
                set statusline+=%f\                          " filename   
                set statusline+=%h%m%r%w                     " status flags  
                set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
                set statusline+=%=                           " right align remainder  
                set statusline+=0x%-8B                       " character value  
                set statusline+=%-14(%l,%c%V%)               " line, character  
                set statusline+=%<%P                         " file position  
        "}          
        " always enable Vim tabs
            set showtabline=2
        " set tab features just like browser
        " open tab, close tab, next tab, previous tab (just like Chrome and Firefox keyboard shortcuts)
          map <C-t> <Esc>:tabnew<CR>
          map <C-F4> <Esc>:tabclose<CR>
          map <C-Tab> <Esc>:tabnext<CR>
          map <C-S-Tab> <Esc>:tabprev<CR>
      endif

    " CUSTOM MAPS
    " Working with splits
    " Switch between splits very fast (for multi-file editing) by maximizing target split - http://vim.wikia.com/wiki/VimTip173
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-H> <C-W>h<C-W>|
    map <C-L> <C-W>l<C-W>|
    map <C-=> <C-W>=

    " save the current file
    map <C-S> :w<CR>
    
    " folding shorcuts
    map - v%zf
    map = v%zd
    
    " Select all
    map <C-a> ggVG

" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <leader>e :e! ~/.vimrc<cr>
    autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Map auto complete of (, ", ', [
    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i

" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    try
        set undodir=~/.vim/temp_dirs/undodir
        set undofile
    catch
    endtry

" CUSTOM FUNCTIONS
"
    function! CHANGE_CURR_DIR()
        let _dir = expand("%:p:h")
        exec "cd " . _dir
        unlet _dir
    endfunction

" Vimwiki configuration
"
    let g:vimwiki_list = [{
        \ 'path': 'D:\user\Dropbox\DOCS\wiki',
        \ 'template_path': 'D:\user\Dropbox\DOCS\wiki\templates',
        \ 'syntax': 'markdown', 
        \ 'ext': '.md',
        \ 'template_default': 'default',
        \ 'template_ext': '.html',
        \ 'css_file': 'D:\user\Dropbox\DOCS\wiki\css\style.css',
        \ 'auto_toc': 1}]
" Plugins Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'fatih/vim-go'
    Plug 'majutsushi/tagbar'
    Plug 'vimwiki/vimwiki'
    Plug 'pangloss/vim-javascript'
    Plug 'chase/vim-ansible-yaml'
" Initialize plugin system
call plug#end()

