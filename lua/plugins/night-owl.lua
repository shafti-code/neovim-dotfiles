return {
        "oxfist/night-owl.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
         config = function()
            -- load the colorscheme here
            require("night-owl").setup()
            vim.cmd.colorscheme("night-owl")
        end,
}
