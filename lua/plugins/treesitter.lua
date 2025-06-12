return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        ignore_install = {"ipkg"},
        highlight = { enable = true },
        incremental_selection = { enable = true },

        textobjects = { select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@comment.outer",
              ["ic"] = "@comment.inner",
            },
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

