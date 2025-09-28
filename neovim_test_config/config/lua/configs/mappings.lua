vim.keymap.set("n", "<Space>", "")
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")

-- buffers
vim.keymap.set("n", "<Right>", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<Left>", ":bprevious<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<cr>", { silent = true })

-- scrolling
vim.keymap.set("n", "<Up>", "<C-y>")
vim.keymap.set("n", "<Down>", "<C-e>")
vim.keymap.set("n", "<S-Up>", "3<C-y>")
vim.keymap.set("n", "<S-Down>", "3<C-e>")

-- split mappings
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<C-Right>", ":vertical resize +4<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -4<CR>")
vim.keymap.set("n", "<C-Up>", ":resize -4<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +4<CR>")

-- searching
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- yank and paste
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>p", '"+p')

local function hide_diagnostics()
    vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
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
