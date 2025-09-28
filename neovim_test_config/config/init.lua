require("configs.general")
require("plugins.treesitter")
require("plugins.gruvbox")
require("plugins.telescope")
require("plugins.mason")

vim.lsp.enable(
	{
		"lua_ls",
		"rust_analyzer",
		"clangd",
	}
)
