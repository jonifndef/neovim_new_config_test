require("configs.general")
require("configs.mappings")

require("plugins.nvim-web-devicons")
require("plugins.treesitter")
require("plugins.gruvbox")
require("plugins.telescope")
require("plugins.mason")
require("plugins.blink")

vim.lsp.enable(
	{
		"lua_ls",
		"rust_analyzer",
		"clangd",
	}
)
