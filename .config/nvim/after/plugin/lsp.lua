vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border="single"})<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)

    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help({border="single"})<cr>', opts)
    vim.keymap.set('n', 'gq', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
  end
})

local blink = require('blink.cmp')
blink.setup({
    keymap = {
        preset = 'default',

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },

        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    },

    appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
        documentation = { auto_show = false },
        menu = {
            draw = {
                columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            },
        },
        ghost_text = {
            enabled = true,
            show_with_menu = true
        }
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning"},

    --signature = { enabled = true },
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = {
            menu = { auto_show = false },
        },
    }
})

require('mason').setup({})

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
            enabled = false,
        },
        pyflakes = {
            enabled = false,
        },
        autopep8 = {
            enabled = false,
        },
        yapf = {
            enabled = false,
        },
      }
    }
  }
})
vim.lsp.enable('pylsp')

vim.lsp.config('ruff', {
  init_options = {
      settings = {
          -- Ruff language server settings go here
          fixAll = true,
          organizeImports = true
      }
  }
})

vim.lsp.enable('ruff')

vim.diagnostic.config({ virtual_text = true })
