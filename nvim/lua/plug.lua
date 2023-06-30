return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'

    use { "bluz71/vim-moonfly-colors", as = "moonfly" }
    use {
      'nvim-lualine/lualine.nvim'
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update() 
        end,
    }
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    use 'terrortylor/nvim-comment'

    use 'ibhagwan/fzf-lua'

    use 'wakatime/vim-wakatime'
end)
