-- init.lua

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'EdenEast/nightfox.nvim'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end)

-- Tabbing
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

-- Color scheme
vim.cmd('colorscheme nightfox')
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = false

-- Key mappings
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

-- LSP stuff
require('mason').setup()
require('mason-lspconfig').setup()
require('lsp')




