require("oil").setup()
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

Retrodark = "#07080D"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keybinds' })
vim.keymap.set('n', '<leader>fw', builtin.builtin, { desc = 'Telescope find pickers' })
vim.keymap.set('n', '<leader>fd', builtin.help_tags, { desc = 'Telescope live grep' })

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

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>")

vim.opt.isfname:append("@-@")
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = ""
vim.opt.wrap = false
vim.keymap.set('n', '<leader>i', '<cmd>lua vim.diagnostic.open_float({border = rounded})<CR>')
--this keybind here pops up the diagnostic window so you can read errors provided by the lsp




-- set the highlight group for background to be this pretty color (nvim dark grey 1) that can be found at https://github.com/nshern/neovim-default-colorscheme-extras
vim.api.nvim_set_hl(0, "Normal", { bg = Retrodark })
-- vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = Retrodark })
vim.api.nvim_set_hl(0, "Pmenu", { bg = Retrodark })
