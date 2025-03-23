return {
        ---@type LazySpec
    {
      "mikavilpas/yazi.nvim",
      event = "VeryLazy",
      dependencies = { "folke/snacks.nvim", lazy = true },
      keys = {
        -- 👇 in this section, choose your own keymappings!
        {
          -- Open in the current working directory
          "<leader>ef",
          "<cmd>Yazi cwd<cr>",
          desc = "Open the file manager in nvim's working directory",
        },
      },
      ---@type YaziConfig | {}
      opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = true,
        keymaps = {
          show_help = "<f1>",
        },
      },
      -- 👇 if you use `open_for_directories=true`, this is recommended
      init = function()
        -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
        -- vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
      end,
    }
}
