vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local detail = false
require("oil").setup({

  keymaps = {
      ["<C-v>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
              detail = not detail
              if detail then
                  require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                  require("oil").set_columns({ "icon" })
              end
          end,
      },
  },
})
