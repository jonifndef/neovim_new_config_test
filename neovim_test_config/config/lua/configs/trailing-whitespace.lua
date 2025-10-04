vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='LightRed' })
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = '*',
	command = [[
		syntax clear TrailingWhitespace |
		syntax match TrailingWhitespace "\_s\+$"
	]]}
)
vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='Red' })
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = '*',
	command = [[
		syntax clear TrailingWhitespace |
		syntax match TrailingWhitespace "\_s\+$"
	]]}
)

TrimTrailingWS = function()
  local view = vim.fn.winsaveview()
  vim.cmd [[%s:\s\+$::e]]
  vim.fn.winrestview(view)
end

vim.keymap.set("n", "<leader>w", TrimTrailingWS, { desc = "Say hello" })
