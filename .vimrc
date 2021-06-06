" These Settings are used by neovim. It's sourced from .vimrc for convenience.

" Use Vim settings rather than Vi settings. Must be first, it affects other options
set nocompatible
set t_Co=256
" =============== Vim Plug ===============
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'numirias/semshi'
Plug 'psf/black'
Plug 'fatih/vim-go'
"Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'junegunn/rainbow_parentheses.vim'
"Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
"Snippets
Plug 'SirVer/ultisnips'
"clipboard
Plug 'svermeulen/vim-cutlass'
call plug#end()            
"================ General ==========================
set showcmd                     " Show incomplete commands at the bottom
set showmode                    " Show current mode at the bottom
set showmatch                   " Show matching brackets and parentheses
syntax enable                   " Syntax highlighting
set modelines=0
set number
set hidden
set visualbell
set relativenumber
set lazyredraw
set background=dark
let g:airline_theme = "base16"
let g:gruvbox_contrast_dark= "hard"
colorscheme gruvbox
set wmh=0
"Turn off swap files
set noswapfile
set nobackup
set nowb
let g:nvim_tree_auto_close = 1
set clipboard+=unnamedplus
" ================ Indentation ======================
set smartindent
set smarttab
" Set softtabs with 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
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
" ================ Folds ==========================
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default
" ================ Lua Config =====================
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
require'nvim-web-devicons'.setup {}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" ================ Search =======================
set ignorecase
set smartcase
set hlsearch        " Highlight search results
" ================ Key maps ========================
let mapleader = " "
"Leader maps.
nnoremap <leader>n :noh<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>t :NvimTreeToggle<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>k <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <Leader>z :Files<CR>
nnoremap <silent> <Leader>x :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>hh :History<CR>
"Default very magic search
nnoremap / /\v
vnoremap / /\v
"Changelist jump
nnoremap ]g g,
nnoremap [g g;
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
"Details for item under cursor.
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
"Swapping semicolon and colon
noremap : ;
noremap ; :
"Use <Tab> and <S-Tab>,<C-j> <C-k> to navigate through popup menu.
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
"Clipboard
nnoremap gm m
noremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D
" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(10)<CR>
inoremap <A-t> <Esc>:call TermToggle(10)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(10)<CR>
" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
" ================ UltiSnips ================
let g:UltiSnipsExpandTrigger = '<f5>'
"=================== Completion nvim ===================
lua require'lspconfig'.elixirls.setup{ cmd = { "/home/solaire/elixir-ls/language_server.sh" } }
lua require'lspconfig'.pyright.setup{}
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': [ 'ts', 'lsp', 'snippet', 'buffer']},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}
autocmd BufEnter * lua require'completion'.on_attach()

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_sorting = "length"
let g:completion_matching_ignore_case = 0
" ================= Python ===========================
let g:python3_host_prog = '/home/solaire/.virtualenvs/neovim3/bin/python'
autocmd BufWritePre *.py execute ':Black'
" =============== Airline Setup =====================
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline_powerline_fonts = 1
" ================== Golang ===========================
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
"====================== Rainbow colors =============
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}']]
let g:rainbow#blacklist = [10,226]
au VimEnter * RainbowParentheses
"====================== Sneak ======================
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
"====================== Elixir =====================
let g:mix_format_on_save = 1
"====================== fzf ========================
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let g:mix_format_silent_errors = 1
"==================== Terminal =====================
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
