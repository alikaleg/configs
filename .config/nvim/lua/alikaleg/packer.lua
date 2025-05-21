vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --[[use ({
        'rose-pine/neovim', as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })]]

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'fugalh/desert.vim'
    use 'nvim-tree/nvim-web-devicons'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use 'f-person/git-blame.nvim'
    use({
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    })
    use({
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function()
            require("neogit").setup {}
        end
    })
    use({
        "ThePrimeagen/harpoon",
        requires = {
            "nvim-lua/plenary.nvim",         -- required
        },
    })
    use 'ggandor/leap.nvim'

    use({
        'saghen/blink.cmp',
        requires = {
            "rafamadriz/friendly-snippets",
        },
    })

    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    })

    --use 'TabbyML/vim-tabby'
end)
