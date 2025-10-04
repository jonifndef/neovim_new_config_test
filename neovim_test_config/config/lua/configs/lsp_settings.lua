-- LSP stuff
local servers = {
    "lua_ls",
    "rust_analyzer",
    "clangd"
}

local telescope = require("telescope.builtin")

local common_keys = {
  { "n", "gd", telescope.lsp_definitions, desc = "Goto definition" },
  { "n", "gr", telescope.lsp_references,  desc = "Goto references" },
  { "n", "gD", vim.lsp.buf.declaration,   desc = "Goto declaration" },
  { "n", "gi", vim.lsp.buf.implementation,desc = "Goto implementation" },
  { "n", "<Leader>gD", vim.lsp.buf.type_definition, desc = "Type definition" },
  { "n", "<Leader>K",  vim.lsp.buf.hover, desc = "Hover" },
  { "n", "<Leader>rn", vim.lsp.buf.rename, desc = "Rename symbol" },
  { "n", "<Leader>co", vim.lsp.buf.code_action, desc = "Code action" },
  { "n", "<Leader>fo", vim.lsp.buf.format, desc = "Format buffer" },
}

for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    keys = common_keys,
  }
end

vim.lsp.enable(servers)

-- Diagnostics
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.o.updatetime = 200

local function hide_diagnostics()
    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
    })
end
local function show_diagnostics()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
    })
end
vim.keymap.set("n", "<leader>dh", hide_diagnostics)
vim.keymap.set("n", "<leader>ds", show_diagnostics)
