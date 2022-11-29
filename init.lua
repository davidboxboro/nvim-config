-- init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
-- used for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'            -- required
    use 'EdenEast/nightfox.nvim'            -- color scheme

    use 'williamboman/mason.nvim'           -- for installing lsps
    use 'williamboman/mason-lspconfig.nvim' -- connects mason with nvim-lspconfig
    use 'neovim/nvim-lspconfig'             -- customize code checking and completion 

    use 'hrsh7th/cmp-nvim-lsp'              -- completion plugins
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'                 -- snip plugins used for completion
    use 'hrsh7th/vim-vsnip'

    use {                                   -- file system traversal
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week (see issue #1193)
    }
end)

-- tabbing
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

-- color scheme
vim.cmd('colorscheme nightfox')
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = false

-- key mappings
local map = vim.api.nvim_set_keymap
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>', {})

map('i', '<up>', '<nop>', {})
map('i', '<down>', '<nop>', {})
map('i', '<left>', '<nop>', {})
map('i', '<right>', '<nop>', {})

map('n', '<up>', '<nop>', {})
map('n', '<down>', '<nop>', {})
map('n', '<left>', '<nop>', {})
map('n', '<right>', '<nop>', {})

-- lsp
require('mason').setup()
require('mason-lspconfig').setup()
require('lsp')

-- tree
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
require('nvim-tree').setup() -- empty setup using defaults


