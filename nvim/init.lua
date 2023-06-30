--[[ init.lua ]]

require("plug")

vim.g.t_co = 256
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local colorscheme = "moonfly"
vim.cmd.colorscheme(colorscheme) 

local opt = vim.opt

-- [[ Context ]]
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4

-- [[ Filetypes ]]
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true 

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true 
opt.incsearch = true 
opt.hlsearch = false 

-- [[ Whitespace ]]
opt.expandtab = true 
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4 

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

-- Spell

vim.api.nvim_set_keymap('n', '<leader>s',
    "<cmd>lua vim.opt.spell=(not vim.opt.spell:get())<CR>",
    { noremap = true, silent = true })

-- treesitter

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- lualine
require("lualine").setup {
    options = {
        theme = colorscheme,
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_x = {'encoding', 'filetype'},
    }
}

-- lsp 
require'lspconfig'.texlab.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                black = true,
            }
        }
    }
}

-- nvimcomment
require'nvim_comment'.setup({ line_mapping= "<leader>cc", operator_mapping = "<leader>c" })

-- fzf-lua

require('fzf-lua').setup({'fzf-tmux'})
vim.api.nvim_set_keymap('n', '<leader>r',
    "<cmd>lua require('fzf-lua').grep_project()<CR>",
    { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>f',
--     "<cmd>lua require('fzf-lua').files()<CR>",
--     { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>d',
    "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>D',
    "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>",
    { noremap = true, silent = true })

-- nvim-tree
require"nvim-tree".setup()
vim.api.nvim_set_keymap('n', '<leader>f',
    ":NvimTreeToggle<CR>",
    { noremap = true, silent = true })
