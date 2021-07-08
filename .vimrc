" These Settings are used by neovim. It's sourced from .vimrc for convenience.

" Use Vim settings rather than Vi settings. Must be first, it affects other options
set nocompatible
set t_Co=256
" =============== Vim Plug ===============
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"indent
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'mhinz/vim-signify'
Plug 'haya14busa/is.vim'
Plug 'sainnhe/sonokai'
Plug 'tomtom/tcomment_vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'psf/black'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nvim-lua/plenary.nvim'
"Go 
Plug 'fatih/vim-go'
"Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
"Autocompletion
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/trouble.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
"Snippets
Plug 'hrsh7th/vim-vsnip'
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
set termguicolors
set wmh=0
let g:sonokai_style = 'andromeda'
colorscheme sonokai
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
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    thorttle_tile = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = true,
        ts = true
        }
    }

require'lspinstall'.setup()
require'lspconfig'.elixirls.setup{ cmd = { "/home/solaire/elixir-ls/language_server.sh"} }
require'lspconfig'.pyright.setup {}
require'lspconfig'.gopls.setup{}
require'lspconfig'.sqls.setup{
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'sqlite3',
                    dataSourceName = '~/Projects/Personal/titap/titap.db'
                },
            }
        }
    }
}
require'lspkind'.init {}
require'lspsaga'.init_lsp_saga {}
require'nvim-web-devicons'.setup {}
require'trouble'.setup {}
require'lualine'.setup {options = {theme = 'material' }}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" ================ Search =======================
set ignorecase
set smartcase
set hlsearch        " Highlight search results
" ================ Key maps ========================
let mapleader = " "
nnoremap <leader>s <cmd>update<cr>
nnoremap <leader>t <cmd>NvimTreeToggle<cr>
nnoremap <leader>w <C-w>v<C-w>l
"Telescope keybindings
nnoremap <silent><Leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent><Leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent><Leader>fs <cmd>Telescope grep_string<CR>
nnoremap <silent><Leader>fbf <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent><Leader>fbt <cmd>Telescope current_buffer_tags<CR>

nnoremap <silent><Leader>lb <cmd>Telescope buffers<CR>
nnoremap <silent><Leader>lo <cmd>Telescope oldfiles<CR>
nnoremap <silent><Leader>lcc <cmd>Telescope commands<CR>
nnoremap <silent><Leader>lch <cmd>Telescope command_history<CR>
nnoremap <silent><Leader>lsh <cmd>Telescope search_history<CR>
nnoremap <silent><Leader>ltt <cmd>Telescope tags<CR>
nnoremap <silent><Leader>lth <cmd>Telescope help_tags<CR>
nnoremap <silent><Leader>lp <cmd>Telescope man_pages<CR>
nnoremap <silent><Leader>lm <cmd>Telescope marks<CR>
nnoremap <silent><Leader>lr <cmd>Telescope registers<CR>
nnoremap <silent><Leader>lts <cmd>Telescope treesitter<CR>

nnoremap <silent><Leader>gc <cmd>Telescope git_commits<CR>
nnoremap <silent><Leader>gbc <cmd>Telescope git_bcommits<CR>
nnoremap <silent><Leader>gs <cmd>Telescope git_status<CR>
"Default very magic search
nnoremap / /\v
vnoremap / /\v
"Changelist jump
nnoremap ]g g,
nnoremap [g g;

nnoremap j gj
nnoremap k gk

"neorg keybndings

"lspsaga keybindings
nnoremap <silent>K <cmd>Lspsaga hover_doc<CR>
nnoremap <silent><leader>ca <cmd>Lspsaga code_action<CR>
" scroll up and down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR> 
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent>gh <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gs <cmd>Lspsaga signature_help<CR>
nnoremap <silent>gr <cmd>Lspsaga rename<CR>
nnoremap <silent>gd <cmd>Lspsaga preview_definition<CR>
nnoremap <silent><leader>cd <cmd>Lspsaga show_line_diagnostics<CR>
nnoremap <silent> ]e <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [e <cmd>Lspsaga diagnostic_jump_prev<CR>
"Use <Tab> and <S-Tab>,<C-j> <C-k> to navigate through popup menu.
"indent
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

nnoremap <BackSpace> <C-^>

inoremap jk <esc>
inoremap fd <esc>
"=================== Completion ===================
" Set completeopt to have a better completion experience
set completeopt=menuone,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" ================= Python ===========================
let g:python3_host_prog = '/home/solaire/.virtualenvs/neovim3/bin/python'
autocmd BufWritePre *.py execute ':Black'
" =============== Airline Setup =====================
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline_powerline_fonts = 1
" ================== Golang ===========================
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_echo_go_info = 0

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
