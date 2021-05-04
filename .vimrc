" This Settings is used by neovim. It's sourced from .vimrc for convenience.

" Use Vim settings rather than Vi settings. Must be first, it affects other options
set nocompatible
set t_Co=256
filetype off

" =============== Vim Plug ===============
call plug#begin()

"fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"gruvbox theme
Plug 'morhetz/gruvbox'
"Nerdcommenter
Plug 'scrooloose/nerdcommenter'
"vim-airline
Plug 'bling/vim-airline'
"Theme for airline
Plug 'vim-airline/vim-airline-themes'
"Tagbar
Plug 'majutsushi/tagbar'
"Autoclose brackets
Plug 'jiangmiao/auto-pairs'
"Emmet
Plug 'mattn/emmet-vim'
"Vim sneak for jumping around in text
Plug 'justinmk/vim-sneak'
"Async Lint engine
Plug 'w0rp/ale'
"vim tmux navigator
Plug 'christoomey/vim-tmux-navigator'
"python env
Plug 'jmcantrell/vim-virtualenv'
"vimux
Plug 'benmills/vimux'
"Nerd Tree
Plug 'scrooloose/nerdtree'
"git fugitive
Plug 'tpope/vim-fugitive'
"Python syntax highlighting
Plug 'numirias/semshi'
"Black
Plug 'psf/black'
"Go
Plug 'fatih/vim-go'
"Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
"Color coded parantheses
Plug 'junegunn/rainbow_parentheses.vim'
"Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
"Snippets
Plug 'SirVer/ultisnips'
" All of your Plugins must be added before the following line
call plug#end()            



"================ General ==========================

set history=1000                " Store :cmdline history.
set showcmd                     " Show incomplete commands at the bottom
set showmode                    " Show current mode at the bottom
set ruler                       " Always show the current position 
set backspace=indent,eol,start  " Allow backspace to delete everything
set autoread                    " Auto reload file when it's changed in the background
set showmatch                   " Show matching brackets and parentheses
syntax enable                   " Syntax highlighting
set encoding=utf-8              " Force UTF-8 as standard encoding
let g:NERDTreeWinSize=27

set modelines=0
set number
set hidden
set visualbell
set t_vb=
set cursorline
set ttyfast
set relativenumber
set undofile
set pastetoggle=<F2>
set lazyredraw
set background=dark
let g:airline_theme = "gruvbox"
let g:gruvbox_contrast_dark= "hard"
colorscheme gruvbox

"Turn off swap files
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent        " Automatically indent
set smartindent
set smarttab

" Set softtabs with 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab


" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vimbackups > /dev/null 2>&1
  set undodir=~/.vimbackups
  set undofile
endif


" ================ Line Breaks ====================

" Don't wrap lines physically (auto insertion of newlines)
set nowrap       "Don't wrap lines
set textwidth=0 wrapmargin=0
set nolist  " list disables linebreak
set sidescroll=5
set listchars+=precedes:<,extends:>

" ================ Folds ============================

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" ================ Completion =======================

"set wildmode=list:longest
set wildmenu                      " Enable ctrl-n and ctrl-p to scroll thru matches


" ================== tree sitter config ====================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" ================ Search =======================

set ignorecase
set smartcase
set incsearch       " Incremental search as you type
set hlsearch        " Highlight search results

" ================ Scrolling ========================

set scrolloff=10         "Start scrolling when we're 20 lines away from margins
set sidescrolloff=15
set sidescroll=1





" ================ Key maps ========================

let mapleader = " "
nnoremap gV `[v`]`
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>n :noh<cr>
"quicksave
noremap <leader>s :update<cr>
noremap <leader>o :GoRun

nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jk <ESC>
inoremap fd <ESC>
nnoremap <leader>w <C-w>v<C-w>l
map K li<Enter><Esc>
nnoremap : ;
vnoremap : ;
nnoremap ; :
vnoremap ; :
inoremap : ;
inoremap ; :
nmap <leader>t ;NERDTreeToggle<CR>
nmap <leader>b ;TagbarToggle<CR>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
command Bd bp\|bd \#

" ================ UltiSnips ================
let g:UltiSnipsExpandTrigger = '<f5>'


" ================ Nerdtree ========================
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ================== Vim go ========================
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'


"=================== Completion nvim ===================
lua require'lspconfig'.elixirls.setup{}
lua require'lspconfig'.pyls.setup{}

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'buffer', 'ts' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}
autocmd BufEnter * lua require'completion'.on_attach()

let g:completion_matching_strategy_list = ['exact','substring','fuzzy']
let g:completion_matching_smart_case = 1

" ================ Others? ========================

set display+=lastline
au FocusLost * :wa

" autocmd VimEnter * NERDTree
" ================= Python ===========================
let g:python_host_prog = '/home/solaire/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/solaire/.virtualenvs/neovim3/bin/python'
autocmd BufWritePre *.py execute ':Black'
" =============== Powerline Setup =====================
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" ================== Golang ===========================
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
au FileType go nmap <leader>d ;GoDoc<CR>
au FileType go nmap <leader>o ;GoDocBrowser<CR>
au FileType go nmap <leader>r ;GoRun %<CR>
au FileType go nmap <leader>f ;GoDecls<CR>

"============================ Rainbow colors ====================
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}']]
let g:rainbow#blacklist = [10,226]
au VimEnter * RainbowParentheses

nnoremap <silent> <Leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

"============================ Sneak ====================
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

"=============================== Elixir ========================
let g:mix_format_on_save = 1

" Finding stuff
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <silent> <Leader>hh :History<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let g:mix_format_silent_errors = 1





" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>


