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
  --{ "n", "<Leader>dp", vim.diagnostic.goto_prev, desc = "Diagnostic prev" },
  --{ "n", "<Leader>dn", vim.diagnostic.goto_next, desc = "Diagnostic next" },
}

for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    keys = common_keys,
  }
end

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.o.updatetime = 200
