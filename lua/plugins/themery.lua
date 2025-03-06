return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
          themes = {"rose-pine","ashen","night-owl"},
          livePreview = true,
        -- add the config here
      })
    end
  }

