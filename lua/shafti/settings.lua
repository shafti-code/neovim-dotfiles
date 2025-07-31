-- this is your file manager, i chose this one because you can edit the filestructure like a text file :D
require("oil").setup({
    view_options = {
        show_hidden = true,
    }
})
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

-- i found this cool dark color hex and use it for all background colors, but typing in the full hex everywhere would be stupid
-- this color can be found at https://github.com/nshern/neovim-default-colorscheme-extras
-- so we have this global here
-- Retrodark = "#07080D"
-- Retro_dark = "#000000"
-- Soft_white = "#D8D8D8"

--here i define some keybinds for telecope, we have
--space ff for "find file"
--space fg for "find via grep"
--space fk for "find keybinds"
--space fw for "find whatever (picker)" if you want to use a picker you dont have a keybind for you can find it here
--space fd for "find docs"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keybinds' })
vim.keymap.set('n', '<leader>fw', builtin.builtin, { desc = 'Telescope find pickers' })
vim.keymap.set('n', '<leader>fd', builtin.help_tags, { desc = 'Telescope live grep' })

--cool trick for moving around lines you have selected, try it, select a line and hit Shift j and Shift K, neat right?
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- if you want to copy something into your system clipboard you can just hit space y
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

-- this is silent deletion, basically if you hit space d + (combo)
-- so like space d, d it will delete current line but wont override your in neovim clibpoard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- some styling for K keybind that is just the default mapping, but now we have this cool border around popup's
-- try it hit K on the set part in vim.keymap.set() and enjoy *bonus, if you hit K and then K again when the float pops up you can go onto it
vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)

-- set up line numbers and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- i like to exit insert mode with Ctrl-c but it caused weird lsp errors so the easiest fix i could find was to just map esc to ctrl - c
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- this cool little keybind lets you "source" lua files so what that means is if you have a lua file (like this config!) -
-- you can just hit space x to see those changes! works on just random files too if you want to quickly test a console program
-- try it! create a file called test.lua write print("hi lua") in it and hit space x
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>")

-- this line fixes a thing with file name sourcing in vim, a good thing to have and you probably would never need to change this
vim.opt.isfname:append("@-@")
--self explanatory options
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--disable mouse
vim.opt.mouse = ""
--we dont like wrap around here just hit gqq to format the line dude :D
vim.opt.wrap = false
--this keybind here pops up the diagnostic window so you can read errors provided by the lsp :D
vim.keymap.set('n', '<leader>i', function () vim.diagnostic.open_float({border = 'rounded'}) end)

vim.o.termguicolors = true
-- this is commented out because i added a colorscheme and i dont need this anymore but having the code ready is hand
-- set some backgrounds to Retrodark from the top of this file (quick tip hit gg to go there)
-- hit space fd and type in nvim_set_hl to read more about it
-- vim.api.nvim_set_hl(0, "Normal", { bg = Retro_dark, fg = Soft_white })
-- vim.api.nvim_set_hl(0, "hi-normal", { fg = Soft_white })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = Retro_dark })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = Retro_dark })

vim.cmd.colorscheme('rose-pine')
vim.opt.list=true

vim.opt.listchars="space:·"
