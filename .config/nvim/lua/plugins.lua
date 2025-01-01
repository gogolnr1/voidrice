-- Plugin Manager: Packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Appearance
    use 'Mofiqul/dracula.nvim' -- Theme
    use 'nvim-lualine/lualine.nvim' -- Statusline

    -- LSP and completion
    use 'neovim/nvim-lspconfig' -- LSP configurations
    use 'hrsh7th/nvim-cmp' -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippet engine

    -- Treesitter for syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- Utilities
    use 'tpope/vim-fugitive' -- Git integration
    use 'lewis6991/gitsigns.nvim' -- Git signs
    use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
    use 'preservim/nerdtree' -- File tree
    use 'mfussenegger/nvim-dap'
 
    -- Add missing plugins from previous setup
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'p00f/nvim-ts-rainbow'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'vim-python/python-syntax'
    use 'tpope/vim-surround'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-commentary'
    use 'sbdchd/neoformat'
    use 'akinsho/bufferline.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'moll/vim-bbye'
    use 'gpanders/editorconfig.nvim'
    use 'tpope/vim-sleuth'
    use 'neoclide/coc.nvim'
    use 'neoclide/coc-pyright'
    use 'mhinz/vim-startify'
end)
