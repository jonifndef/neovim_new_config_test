require("configs.general")
require("configs.mappings")

require("plugins.nvim-web-devicons")
require("plugins.treesitter")
require("plugins.gruvbox")
require("plugins.telescope")
require("plugins.mason")
require("plugins.blink")
require("configs.lsp_settings")

-- show diagnostics in a floating window when holding the cursor
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.o.updatetime = 200
