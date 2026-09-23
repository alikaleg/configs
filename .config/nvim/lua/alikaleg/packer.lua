vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'nvim-tree/nvim-web-devicons'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'f-person/git-blame.nvim',
        branch = "main",
    }
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
    use 'https://codeberg.org/andyg/leap.nvim'

    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    })
    use({
        'saghen/blink.cmp',
        tag = 'v1.10.2',
        requires = {
            "rafamadriz/friendly-snippets",
        },
    })

    use "stevearc/aerial.nvim"
    use "scottmckendry/cyberdream.nvim"
    use "rebelot/kanagawa.nvim"
    
    use "folke/snacks.nvim"
    use "nickjvandyke/opencode.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
end)
