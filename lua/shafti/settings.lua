require('lualine').setup{}
vim.g.mapleader = " "

vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<leader>th', ":Themery<CR>")

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
--
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


vim.opt.nu = true
vim.opt.relativenumber = true

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.opt.isfname:append("@-@")
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = ""
vim.keymap.set('n', '<leader>i', '<cmd>lua vim.diagnostic.open_float()<CR>')
--this keybind here pops up the diagnostic window so you can read errors provided by the lsp


vim.opt.termguicolors = true
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none'})
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none'})
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none'})
-- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none'})
