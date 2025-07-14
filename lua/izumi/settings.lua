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
vim.keymap.set("i", "<C-c>", "<Esc>")

-- this cool little keybind lets you "source" lua files so what that means is if you have a lua file (like this config!) -
-- you can just hit space x to see those changes! works on just random files too if you want to quickly test a console program
-- try it! create a file called test.lua write print("hi lua") in it and hit space x
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>")

-- this line fixes a thing with file name sourcing in vim, a good thing to have and you probably would never need to change this
vim.opt.isfname:append("@-@")
--self explanatory options
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.smartindent = true
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

vim.cmd.colorscheme('tokyonight')
