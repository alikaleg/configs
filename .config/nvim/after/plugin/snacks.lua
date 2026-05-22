require("snacks").setup({
    bigfile = { enabled = true },
    scroll = {
        enabled = true,
        animate = {
            duration = { step = 10, total = 100 },
            easing = "linear",
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
            delay = 100, -- delay in ms before using the repeat animation
            duration = { step = 5, total = 50 },
            easing = "linear",
        },
    },
    input = {}, -- Enhances `ask()`
    picker = { -- Enhances `select()`
        actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
        },
        win = {
            input = {
                keys = {
                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
            },
        },
    },
})
