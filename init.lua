-- init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
-- used for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'takac/vim-hardtime' -- stop using hjkl

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug('ojroques/vim-oscyank', {branch = 'main'})

vim.call('plug#end')

-- packer
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

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
end)

-- vim-hardtime
vim.g.hardtime_default_on = 0
vim.g.hardtime_maxcount = 0

-- color scheme
vim.cmd('colorscheme nightfox')
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true

--python indenting
vim.cmd([[
let g:python_indent = {}
let g:python_indent.open_paren = 'shiftwidth()'
let g:python_indent.nested_paren = 'shiftwidth()'
let g:python_indent.continue = 'shiftwidth()'
let g:python_indent.closed_paren_align_last_line = v:false
]])

-- key mappings
local map = vim.keymap.set
map('n', '<c-s>', ':w<CR>', {}) -- saving
map('i', '<c-s>', '<Esc>:w<CR>', {}) -- saving
map('i', 'jk', '<Esc>', {}) -- escape
map('v', 'jk', '<Esc>', {}) -- escape

-- disable arrow keys (unnecessary if vim-hardtime enabled)
map('i', '<up>', '<nop>', {})
map('i', '<down>', '<nop>', {})
map('i', '<left>', '<nop>', {})
map('i', '<right>', '<nop>', {})

map('n', '<up>', '<nop>', {})
map('n', '<down>', '<nop>', {})
map('n', '<left>', '<nop>', {})
map('n', '<right>', '<nop>', {})

-- tabbing
-- make sure it is applied every time buffer is opened
local group = vim.api.nvim_create_augroup('all', {});
vim.api.nvim_create_autocmd('BufEnter', {
    group = group,
    callback = function()
        vim.bo.expandtab = true
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
    end
})

-- lsp
require('mason').setup()
require('mason-lspconfig').setup()
require('lsp')

-- tree
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
require('nvim-tree').setup() -- empty setup using defaults


