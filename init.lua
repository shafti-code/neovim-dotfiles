vim.pack.add {
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/tpope/vim-fugitive'},
}

vim.lsp.enable(
    { 'gopls', 'html', 'intelephense', 'bashls', 'nixd', 'lua_ls', 'prismals', 'rust_analyzer', 'svelte', 'ts_ls', 'zls', 'hls' },
    true)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.lsp.inlay_hint.enable(true)
vim.lsp.codelens.enable(true)
vim.lsp.linked_editing_range.enable(true)


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        vim.keymap.set('i', '<C-n>', vim.lsp.omnifunc)
        vim.cmd("set completeopt+=noselect")
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keybinds' })
vim.keymap.set('n', '<leader>fp', builtin.builtin, { desc = 'Telescope find pickers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope live grep' })

require("oil").setup({
    view_options = {
        show_hidden = true
    }
})
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)

vim.opt.nu = true
vim.opt.relativenumber = true


vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>")

vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")

vim.keymap.set("t", "<C-w>v", "<C-\\><C-n><C-w>v")
vim.keymap.set("t", "<C-w>s", "<C-\\><C-n><C-w>s")
vim.keymap.set("t", "<C-w>q", "<C-\\><C-n><C-w>q")

vim.keymap.set("n", "<leader>n", "<CMD>cnext<CR>")
vim.keymap.set("n", "<leader>p", "<CMD>cprevious<CR>")

vim.opt.isfname:append("@-@")
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.autoindent = true

vim.keymap.set('n', '<leader>i', function() vim.diagnostic.open_float({ border = 'rounded' }) end)

vim.o.termguicolors = false
vim.opt.list = false

vim.cmd.colorscheme('torte')

-- compile mode

compile_command = ""
compile_mode_buffer_id = -1
function compile_mode()
    vim.ui.input({default = compile_command},function(input)
        if input == nil then
            return
        end
        if compile_mode_buffer_id ~= -1 then
            vim.api.nvim_buf_delete(compile_mode_buffer_id,{force = true})
        end
            compile_mode_buffer_id = vim.api.nvim_create_buf(false,false)
            compile_command = input
            vim.api.nvim_open_win(compile_mode_buffer_id,true,{vertical = false,win = 0})
            vim.fn.jobstart(vim.fn.split(compile_command),{term = true})
    end)
end
vim.keymap.set("n", "<leader>pc",function() compile_mode() end)


-- nano/emacs like keybinds in normal mode
vim.keymap.set("i", "<C-a>", "<ESC>I")
vim.keymap.set("i", "<C-e>", "<ESC>A")
vim.keymap.set("i", "<C-f>", "<ESC>la")
vim.keymap.set("i", "<C-b>", "<ESC>i")
vim.keymap.set("i", "<M-f>", "<ESC>lwa")
vim.keymap.set("i", "<M-b>", "<ESC>bi")
