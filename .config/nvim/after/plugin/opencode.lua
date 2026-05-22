---@type opencode.Opts
vim.g.opencode_opts = {
  -- Edit these prompts or add your own
  -- prompts = {
  --   customize = { prompt = "Customize @this for @buffers" },
  -- },
  -- Point to a specific server, or leave nil for auto-detect
  -- server = { url = "localhost:3001" },
  -- Enable experimental LSP integration
  -- lsp = { enabled = true },
}
vim.o.autoread = true
-- Ask opencode about the current selection/cursor context
vim.keymap.set({ "n", "x" }, "<leader>oa",
  function() require("opencode").ask("@this: ", { submit = true }) end,
  { desc = "Ask opencode…" })
-- Select from prompts, commands, and server controls
vim.keymap.set({ "n", "x" }, "<leader>ox",
  function() require("opencode").select() end,
  { desc = "Select opencode…" })
-- Toggle the opencode terminal
vim.keymap.set({ "n", "t" }, "<leader>ot",
  function() require("opencode").toggle() end,
  { desc = "Toggle opencode" })
