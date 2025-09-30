vim.pack.add({
    { src = "https://github.com/Saghen/blink.cmp.git" },
})

require "blink.cmp".setup({
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    signature = { enabled = true }
})
