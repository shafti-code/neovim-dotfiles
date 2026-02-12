-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

-- this is your file manager, i chose this one because you can edit the filestructure like a text file :D
vim.keymap.set("n", "<leader>pv", "<CMD>Ex<CR>")


--here i define some keybinds for telecope, we have
--space ff for "find file"
--space fg for "find via grep"
--space fk for "find keybinds"
--space fw for "find picker" if you want to use a picker you dont have a keybind for you can find it here
--space fd for "find help"
--space fm for "find manpages"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keybinds' })
vim.keymap.set('n', '<leader>fp', builtin.builtin, { desc = 'Telescope find pickers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope live grep' })

--cool trick for moving around lines you have selected, try it, select a line and hit Shift j and Shift K, neat right?
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- if you want to copy something into your system clipboard you can just hit space y
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

-- this is silent deletion, basically if you hit space d + (combo)
-- so like space d, d it will delete current line but wont override your in neovim clipboard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- some styling for K keybind that is just the default mapping, but now we have this cool border around popup's
-- try it hit K on the set part in vim.keymap.set() and enjoy *bonus, if you hit K and then K again when the float pops up you can go onto it
-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end)
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

vim.keymap.set("t","<C-w>h","<C-\\><C-n><C-w>h")
vim.keymap.set("t","<C-w>j","<C-\\><C-n><C-w>j")
vim.keymap.set("t","<C-w>k","<C-\\><C-n><C-w>k")
vim.keymap.set("t","<C-w>l","<C-\\><C-n><C-w>l")

vim.keymap.set("t","<C-w>v","<C-\\><C-n><C-w>v")
vim.keymap.set("t","<C-w>s","<C-\\><C-n><C-w>s")
vim.keymap.set("t","<C-w>q","<C-\\><C-n><C-w>q")

-- this line fixes a thing with file name sourcing in vim, a good thing to have and you probably would never need to change this
vim.opt.isfname:append("@-@")
--self explanatory options
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.o.statusline = "%t"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--disable mouse
vim.opt.mouse = ""
--we dont like wrap around here just hit gqq to format the line dude :D
vim.opt.wrap = false
--this keybind here pops up the diagnostic window so you can read errors provided by the lsp :D
vim.keymap.set('n', '<leader>i', function() vim.diagnostic.open_float({ border = 'rounded' }) end)

vim.o.termguicolors = false
vim.opt.list = true

-- vim.opt.listchars = "space:·"
