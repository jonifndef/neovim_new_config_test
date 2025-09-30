vim.pack.add({
    { src = "https://github.com/Saghen/blink.cmp.git" },
})

require "blink.cmp".setup({
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    signature = { enabled = true }
})

-- in order to solve the Ctrl-p issue in completion, add a ~/.docker/config.json with the following contents:
-- {
--     "detachKeys": "ctrl-e,e"
-- }
